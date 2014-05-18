//
//  ParsingOperation.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "ParsingOperation.h"
#import "DataManager.h"

@interface ParsingOperation ()

@property (nonatomic) BOOL success;
@property (nonatomic) NSString *filePath;

@end

@implementation ParsingOperation

- (id)initWithFilePath:(NSString *)filePath parsingBlock:(ParsingOperationBlock)parsingBlock
{
    if (self = [super init]) {
        self.filePath = filePath;
        self.parsingBlock = parsingBlock;
    }
    return self;
}

- (void)main
{
//    double x0 = CACurrentMediaTime();
//    NSLog(@"START: %@: (%f) %@", [self.filePath lastPathComponent], x0, self);
    NSError *error = nil;
    
    if (!self.parsingBlock ||
        !self.filePath ||
        ![[NSFileManager defaultManager] fileExistsAtPath:self.filePath])
        return;
    
    NSInputStream *inputStream = [NSInputStream inputStreamWithFileAtPath:self.filePath];
    [inputStream open];
    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithStream:inputStream options:0 error:&error];
    [inputStream close];
    
    if (error || !jsonObject)
        return;
//    
//    double x1 = CACurrentMediaTime();
//    NSLog(@"PARSE: %@[%d]: (%f) %@", [self.filePath lastPathComponent], [jsonObject count], x1-x0, self);
    
    NSManagedObjectContext *context = [[DataManager sharedInstance] createBackgroundContext];
    
    [self iterateOnArray:jsonObject block:^void(NSArray *subarray) {
        
        NSManagedObjectContext *childContext = [[NSManagedObjectContext alloc] init];
        childContext.parentContext = context;
        
        for (NSDictionary *dictionary in subarray) {
            if (!self.parsingBlock(dictionary, childContext))
                return;
        }
        
        [childContext save:nil];
    }];
    
    if (![context save:&error])
        return;
    
    self.success = YES;
//    
//    double x2 = CACurrentMediaTime();
//    NSLog(@"  END: %@: (%f) %@", [self.filePath lastPathComponent], x2-x0, self);
}

/**
 Split parse operation into several sub-operations to improve performance.
 */
- (void)iterateOnArray:(NSArray*)array block:(void(^)(NSArray *subarray))block
{
    NSInteger batchSize = 500;
    NSUInteger count = [array count];
    
    NSMutableArray *operations = [[NSMutableArray alloc] init];
    
    for (uint i = 0; i < count; i += batchSize) {
//        NSString *log = [NSString stringWithFormat:@"PARSE: %@[%d-%d]", [self.filePath lastPathComponent], i, MIN(i+batchSize, count)];
//        
        NSArray *subarray = [array subarrayWithRange:(NSRange){ i, MIN(batchSize, count-i) }];
        
        [operations addObject:
         [NSBlockOperation blockOperationWithBlock:^{
            block(subarray);
//            NSLog(@"%@", log);
        }]];
    }
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperations:operations waitUntilFinished:YES];
}

@end

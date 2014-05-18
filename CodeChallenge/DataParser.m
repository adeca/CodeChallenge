//
//  DataParser.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "DataParser.h"
#import "ParsingOperation+Factory.h"

@interface DataParser ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation DataParser

- (id)init
{
    if (self = [super init]) {
        self.queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (void)parseWithCompletion:(void(^)(BOOL success))completion
{
    ParsingOperation *categoryParsing = [ParsingOperation categoryParsingOperation];
    ParsingOperation *exerciseParsing = [ParsingOperation exerciseParsingOperation];
    ParsingOperation *foodParsing = [ParsingOperation foodParsingOperation];
    
    [foodParsing addDependency:categoryParsing];
    
    NSOperation *completionOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        BOOL success = categoryParsing.success;
        
        if (completion)
            completion(success);
    }];
    
    [completionOperation addDependency:categoryParsing];
    [completionOperation addDependency:exerciseParsing];
    [completionOperation addDependency:foodParsing];
    
    [self.queue addOperations:@[categoryParsing, exerciseParsing, foodParsing, completionOperation] waitUntilFinished:NO];
}

@end

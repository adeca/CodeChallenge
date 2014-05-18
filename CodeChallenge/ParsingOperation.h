//
//  ParsingOperation.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^ParsingOperationBlock)(NSDictionary *dictionary, NSManagedObjectContext *context);

@interface ParsingOperation : NSOperation

@property (nonatomic, readonly) BOOL success;
@property (nonatomic, readonly) NSString *filePath;

@property (nonatomic, copy) ParsingOperationBlock parsingBlock;

- (id)initWithFilePath:(NSString *)filePath parsingBlock:(ParsingOperationBlock)parsingBlock;

@end


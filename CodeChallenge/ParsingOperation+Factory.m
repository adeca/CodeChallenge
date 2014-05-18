//
//  ParsingOperation+Factory.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "ParsingOperation+Factory.h"
#import "CCCategory+Parsing.h"
#import "CCFood+Parsing.h"
#import "CCExercise+Parsing.h"

@implementation ParsingOperation (Factory)

+ (instancetype)categoryParsingOperation
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"categoriesStatic" ofType:@"json"];
    
    return [[self alloc] initWithFilePath:filePath parsingBlock:
            ^BOOL(NSDictionary *dictionary, NSManagedObjectContext *context) {
                return [CCCategory createOrUpdateEntityForDictionary:dictionary inContext:context] != nil;
            }];
}
+ (instancetype)exerciseParsingOperation
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"exercisesStatic" ofType:@"json"];
    
    return [[self alloc] initWithFilePath:filePath parsingBlock:
            ^BOOL(NSDictionary *dictionary, NSManagedObjectContext *context) {
                return [CCExercise createOrUpdateEntityForDictionary:dictionary inContext:context] != nil;
            }];
}
+ (instancetype)foodParsingOperation
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"foodStatic" ofType:@"json"];
    
    return [[self alloc] initWithFilePath:filePath parsingBlock:
            ^BOOL(NSDictionary *dictionary, NSManagedObjectContext *context) {
                return [CCFood createOrUpdateEntityForDictionary:dictionary inContext:context] != nil;
            }];
}

@end

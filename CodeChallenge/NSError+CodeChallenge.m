//
//  NSError+CodeChallenge.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "NSError+CodeChallenge.h"

NSString *const CodeChallengeErrorDomain = @"come.adc.CodeChallenge";

@implementation NSError (CodeChallenge)

+ (NSError*)errorWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo
{
    return [self errorWithDomain:CodeChallengeErrorDomain code:code userInfo:userInfo];
}

+ (NSError*)errorWithCode:(NSInteger)code
              description:(NSString*)format, ...
{
    va_list arguments;
    va_start(arguments, format);
    NSString *description = [[NSString alloc] initWithFormat:format arguments:arguments];
    va_end(arguments);
    
    return [self errorWithCode:code userInfo:@{NSLocalizedDescriptionKey:description}];
}

@end

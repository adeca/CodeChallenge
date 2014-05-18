//
//  NSError+CodeChallenge.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CCErrorCode) {
    CCParseError = 999,
};

extern NSString *const CodeChallengeErrorDomain;

@interface NSError (CodeChallenge)

+ (NSError*)errorWithCode:(NSInteger)code
                 userInfo:(NSDictionary *)userInfo;

+ (NSError*)errorWithCode:(NSInteger)code
              description:(NSString*)format, ... NS_FORMAT_FUNCTION(2,3);

@end

//
//  Parseable.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Parseable <NSObject>

/*
 Attempts to convert the object into a string.
 Only works for numbers and strings, all other objects return nil.
 */
- (NSString*)asString;

/*
 Attempts to convert the object into a string representing a boolean value ('true'/'false').
 Only works for numbers and strings, all other objects return nil.
 */
- (NSString*)asBooleanString;

/*
 Attempts to convert the object into a number.
 Only works for numbers, dates and properly formatted strings, all other objects return nil.
 */
- (NSNumber*)asNumber;

/*
 Attempts to convert the object into a number representing a boolean value.
 Only works for numbers and properly formatted strings, all other objects return nil.
 */
- (NSNumber*)asBooleanNumber;

/*
 Attempts to convert the object into a date.
 Only works for numbers and strings representing timestamps, all other objects return nil.
 */
- (NSDate*)asDate;

@end

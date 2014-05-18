//
//  NSObject+Parsing.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "NSObject+Parsing.h"

@implementation NSObject (Parsing)

- (NSString*)asString
{
    return nil;
}
- (NSString*)asBooleanString
{
    return nil;
}
- (NSNumber*)asNumber
{
    return nil;
}
- (NSNumber*)asBooleanNumber
{
    return nil;
}
- (NSDate*)asTimestampDate
{
    return nil;
}

@end

@implementation NSString (Parsing)

- (NSString*)asString
{
    return self;
}
- (NSString*)asBooleanString
{
    NSString *lowercase = [self lowercaseString];
    
    NSArray *validBooleanStrings = @[@"yes", @"true", @"no", @"false"];
    return [validBooleanStrings containsObject:lowercase] ? lowercase : nil;
}
- (NSNumber*)asNumber
{
    static NSNumberFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSNumberFormatter alloc] init];
    });
    
    NSNumber *result = [formatter numberFromString:self];
    
    // attempt conversion to boolean
    if (!result) {
        result = [self asBooleanNumber];
    }
    return result;
}
- (NSNumber*)asBooleanNumber
{
    NSString *booleanString = [self asBooleanString];
    return booleanString ? @(booleanString.boolValue) : nil;
}
- (NSDate*)asDate
{
    return [[self asNumber] asDate];
}

@end

@implementation NSNumber (Parsing)

- (NSString*)asString
{
    // convert bool values to JSON true/false strings
    if (strcmp([self objCType], @encode(BOOL)) == 0)
        return [self asBooleanString];
    
    static NSNumberFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSNumberFormatter alloc] init];
        
        [formatter setAllowsFloats:YES];
        [formatter setMaximumFractionDigits:2];
    });
    
    return [formatter stringFromNumber:self];
}
- (NSString*)asBooleanString
{
    return [self boolValue] ? @"true" : @"false";
}
- (NSNumber*)asNumber
{
    return self;
}
- (NSNumber*)asBooleanNumber
{
    return @([self boolValue]);
}
- (NSDate*)asDate
{
    return [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
}

@end

@implementation NSDate (Parsing)

- (NSNumber*)asNumber
{
    return @([self timeIntervalSince1970]);
}
- (NSDate*)asDate
{
    return self;
}

@end

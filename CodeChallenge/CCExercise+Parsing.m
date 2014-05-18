//
//  CCExercise+Parsing.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "CCExercise+Parsing.h"
#import "CCName+Parsing.h"
#import "CCExerciseName.h"

@implementation CCExercise (Parsing)

- (void)populateWithDictionary:(NSDictionary*)dictionary
{
    [super populateWithDictionary:dictionary];
    
    if (!self.name) {
        self.name = [CCExerciseName createInContext:self.managedObjectContext];
    }
    [self.name populateWithDictionary:dictionary
                            keyPrefix:@"name_"
                           defaultKey:@"title"];
//    NSLog(@"%@", self);
}

+ (NSDictionary*)keyMapping
{
    return @{
             @"oid":                @"oid",
             @"addedbyuser":        @"addedByUser",
             @"calories":           @"calories",
             @"custom":             @"custom",
             @"deleted":            @"deleted",
             @"downloaded":         @"downloaded",
             @"hidden":             @"hidden",
             @"lastupdated":        @"lastUpdated",
             @"photo_version":      @"photoVersion",
             };
}
+ (NSString*)primaryKey
{
    return @"oid";
}

@end

//
//  CCCategory+Parsing.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "CCCategory+Parsing.h"
#import "CCName+Parsing.h"
#import "CCCategoryName.h"

@implementation CCCategory (Parsing)

- (void)populateWithDictionary:(NSDictionary*)dictionary
{
    [super populateWithDictionary:dictionary];
    
    if (!self.name) {
        self.name = [CCCategoryName createInContext:self.managedObjectContext];
    }
    [self.name populateWithDictionary:dictionary
                            keyPrefix:@"name_"
                           defaultKey:@"category"];
//    NSLog(@"%@", self);
}

+ (NSDictionary*)keyMapping
{
    return @{
             @"oid":                @"oid",
             @"servingscategory":   @"servingsCategory",
             @"photo_version":      @"photoVersion",
             @"headcategoryid":     @"headCategory",
             @"lastupdated":        @"lastUpdated",
             };
}
+ (NSString*)primaryKey
{
    return @"oid";
}

@end

//
//  CCFood+Parsing.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "CCFood+Parsing.h"
#import "CCCategory.h"

@implementation CCFood (Parsing)

- (void)populateWithDictionary:(NSDictionary*)dictionary
{
    [super populateWithDictionary:dictionary];
    
    NSString *language = dictionary[@"language"];
    NSArray *components = [language componentsSeparatedByString:@"_"];
    
    self.language = [components firstObject];
    self.locale = [components lastObject];
    
    NSNumber *categoryId = dictionary[@"categoryid"];
    CCCategory *category = [[CCCategory findAllWhereField:@"oid"
                                                   equals:categoryId
                                                inContext:self.managedObjectContext] firstObject];
    self.category = category;
//    NSLog(@"%@", self);
}

+ (NSDictionary*)keyMapping
{
    return @{
             @"oid":                @"oid",
             @"downloaded":         @"downloaded",
             @"pcsingram":          @"gramsPerPiece",
             @"source_id":          @"sourceId",
             @"showmeasurement":    @"showMeasurement",
             @"cholesterol":        @"cholesterol",
             @"gramsperserving":    @"gramsPerServing",
             @"sugar":              @"sugar",
             @"fiber":              @"fiber",
             @"mlingram":           @"gramsPerMilliliter",
             @"pcstext":            @"pieceDescription",
             @"lastupdated":        @"lastUpdated",
             @"addedbyuser":        @"addedByUser",
             @"fat":                @"fat",
             @"sodium":             @"sodium",
             @"deleted":            @"deleted",
             @"hidden":             @"hidden",
             @"custom":             @"custom",
             @"calories":           @"calories",
             @"servingcategory":    @"servingsCategory",
             @"saturatedfat":       @"saturatedFat",
             @"potassium":          @"potassium",
             @"brand":              @"brand",
             @"carbohydrates":      @"carbohydrates",
             @"typeofmeasurement":  @"typeOfMeasurement",
             @"protein":            @"protein",
             @"defaultsize":        @"defaultSize",
             @"showonlysametype":   @"showOnlySameType",
             @"unsaturatedfat":     @"unsaturatedFat",
             @"title":              @"title",
             };
}
+ (NSString*)primaryKey
{
    return @"oid";
}

@end

//
//  NSManagedObject+Parsing.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "NSManagedObject+Parsing.h"
#import "NSObject+Parsing.h"

@implementation NSManagedObject (Parsing)

+ (instancetype)entityForDictionary:(NSDictionary*)dictionary inContext:(NSManagedObjectContext*)context;
{
    NSString *primaryKey = self.primaryKey;
    if (!primaryKey)
        return nil;

    id value = dictionary[primaryKey];
    NSString *attribute = (self.keyMapping[primaryKey] ?: primaryKey);
    
    if (!attribute || !value)
        return nil;
    
    return [[self findAllWhereField:attribute equals:value inContext:context] firstObject];
}
+ (instancetype)createOrUpdateEntityForDictionary:(NSDictionary*)dictionary inContext:(NSManagedObjectContext*)context;
{
    NSManagedObject *entity = [self entityForDictionary:dictionary inContext:context];
    
    if (!entity) {
        entity = [self createInContext:context];
    }
    
    [entity populateWithDictionary:dictionary];
    
    return entity;
}

- (void)populateWithDictionary:(NSDictionary*)dictionary
{
    NSDictionary *mapping = [self class].keyMapping;
    if (mapping.count == 0)
        return;
    
    NSDictionary *attributes = self.entity.attributesByName;
    
    [dictionary each:^(NSString *key, id value) {
        
        NSString *attributeName = mapping[key];
        NSAttributeDescription *attribute = attributes[attributeName];
        
        if (attribute) {
            id convertedValue = [self convertValue:value
                                  forAttributeType:attribute.attributeType];
            
            [self setValue:convertedValue forKey:attributeName];
        }
    }];
}

- (id)convertValue:(id)value forAttributeType:(NSAttributeType)attributeType
{
    switch (attributeType) {
        case NSInteger16AttributeType:
        case NSInteger32AttributeType:
        case NSInteger64AttributeType:
        case NSDecimalAttributeType:
        case NSDoubleAttributeType:
        case NSFloatAttributeType:
            return [value asNumber];
            
        case NSStringAttributeType:
            return [value asString];
            
        case NSBooleanAttributeType:
            return [value asBooleanNumber];
            
        case NSDateAttributeType:
            return [value asDate];
            
        default:
            return value;
    }
}

+ (NSDictionary*)keyMapping
{
    return nil;
}
+ (NSString*)primaryKey
{
    return nil;
}

@end

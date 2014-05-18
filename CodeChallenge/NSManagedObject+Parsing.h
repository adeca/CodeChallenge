//
//  NSManagedObject+Parsing.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Parsing)

- (id)convertValue:(id)value forAttributeType:(NSAttributeType)attributeType;

+ (instancetype)entityForDictionary:(NSDictionary*)dictionary inContext:(NSManagedObjectContext*)context;
+ (instancetype)createOrUpdateEntityForDictionary:(NSDictionary*)dictionary inContext:(NSManagedObjectContext*)context;

+ (NSDictionary*)keyMapping;
+ (NSString*)primaryKey;

- (void)populateWithDictionary:(NSDictionary*)dictionary;

@end

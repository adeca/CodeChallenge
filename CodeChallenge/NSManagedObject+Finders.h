//
//  NSManagedObject+Finders.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Finders)

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context;

+ (NSArray *)findAllWithPredicate:(NSPredicate *)predicate
                        inContext:(NSManagedObjectContext *)context;

+ (NSArray *)findAllWithPredicate:(NSPredicate *)predicate
                         sortedBy:(NSString *)sortKey
                        ascending:(BOOL)ascending
                        inContext:(NSManagedObjectContext *)context;

+ (NSArray *)findAllWhereField:(NSString *)fieldName
                        equals:(id)value
                     inContext:(NSManagedObjectContext *)context;

+ (NSArray *)findAllWhereField:(NSString *)fieldName
                          isIn:(id<NSFastEnumeration>)collection
                     inContext:(NSManagedObjectContext *)context;

+ (NSArray *)findAllWithPredicate:(NSPredicate *)predicate
               retrieveAttributes:(NSArray *)attributes
                        inContext:(NSManagedObjectContext *)context;

+ (NSArray *)findAllWhereField:(NSString *)fieldName
                        equals:(id)value
            retrieveAttributes:(NSArray *)attributes
                     inContext:(NSManagedObjectContext *)context;

+ (NSArray *)findDistinctValuesOfAttribute:(NSString *)attribute
                             withPredicate:(NSPredicate *) predicate
                                 ascending:(BOOL)ascending
                                 inContext:(NSManagedObjectContext *)context;

@end

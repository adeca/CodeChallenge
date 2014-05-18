//
//  NSManagedObject+Finders.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "NSManagedObject+Finders.h"
#import "NSManagedObject+Requests.h"

@implementation NSManagedObject (Finders)

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context
{
    NSFetchRequest* fetchRequest = [self requestInContext:context];
    return [context executeFetchRequest:fetchRequest error:nil];
}

+ (NSArray *)findAllWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest* fetchRequest = [self requestWithPredicate:predicate
                                                    inContext:context];
    return [context executeFetchRequest:fetchRequest error:nil];
}

+ (NSArray *)findAllWithPredicate:(NSPredicate *)predicate
                         sortedBy:(NSString *)sortKey
                        ascending:(BOOL)ascending
                        inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest* fetchRequest = [self requestWithPredicate:predicate
                                                    inContext:context];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:sortKey ascending:ascending]];
    
    return [context executeFetchRequest:fetchRequest error:nil];
}

+ (NSArray *)findAllWhereField:(NSString *)fieldName
                        equals:(id)value
                     inContext:(NSManagedObjectContext *)context
{
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"%K == %@", fieldName, value];
    return [self findAllWithPredicate:predicate
                            inContext:context];
}

+ (NSArray *)findAllWhereField:(NSString *)fieldName
                          isIn:(id<NSFastEnumeration>)collection
                     inContext:(NSManagedObjectContext *)context
{
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"%K IN %@", fieldName, collection];
    return [self findAllWithPredicate:predicate
                            inContext:context];
}

+ (NSArray *)findAllWithPredicate:(NSPredicate *)predicate
               retrieveAttributes:(NSArray *)attributes
                        inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest* fetchRequest = [self requestWithPredicate:predicate
                                                    inContext:context];
    [fetchRequest setResultType:NSDictionaryResultType];
    [fetchRequest setPropertiesToFetch:attributes];
    [fetchRequest setPredicate:predicate];
    
    return [context executeFetchRequest:fetchRequest error:nil];
}

+ (NSArray *)findAllWhereField:(NSString *)fieldName
                        equals:(id)value
            retrieveAttributes:(NSArray *)attributes
                     inContext:(NSManagedObjectContext *)context
{
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"%K == %@", fieldName, value];
    
    return [self findAllWithPredicate:predicate
                   retrieveAttributes:attributes
                            inContext:context];
}

+ (NSArray *)findDistinctValuesOfAttribute:(NSString *)attribute
                             withPredicate:(NSPredicate *) predicate
                                 ascending:(BOOL)ascending
                                 inContext:(NSManagedObjectContext *)context
{
    // create the fetch request and set the attributes of the request based on the given parameters
    NSFetchRequest* fetchRequest = [self requestWithPredicate:predicate
                                                    inContext:context];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:attribute
                                                                   ascending:ascending];
    
    [fetchRequest setResultType:NSDictionaryResultType];
    [fetchRequest setPropertiesToFetch:@[attribute]];
    [fetchRequest setReturnsDistinctResults:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    // execute the fetch, result is returned in an array of dictionaries
    NSArray * attributeArray = [context executeFetchRequest:fetchRequest error:nil];
    
    return [attributeArray valueForKey:attribute];
}

@end

//
//  NSManagedObject+Requests.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "NSManagedObject+Requests.h"
#import "NSManagedObject+Helper.h"

@implementation NSManagedObject (Requests)

+ (NSFetchRequest *) requestInContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[self entityDescriptionInContext:context]];
    
    return request;
}

+ (NSFetchRequest *) requestWithPredicate:(NSPredicate *)searchTerm inContext:(NSManagedObjectContext *)context;
{
    NSFetchRequest *request = [self requestInContext:context];
    
    if (searchTerm)
        [request setPredicate:searchTerm];
    
    return request;
}

+ (NSFetchedResultsController *)resultsControllerWithPredicate:(NSPredicate*)predicate
                                                      sortedBy:(NSString *)sortKey
                                                     ascending:(BOOL)ascending
                                            sectionNameKeyPath:(NSString*)keyPath
                                                     inContext:(NSManagedObjectContext*)context;
{
    NSFetchRequest *request = [self requestInContext:context];
    [request setSortDescriptors:
     @[[[NSSortDescriptor alloc] initWithKey:sortKey ascending:ascending]]];
    
    [request setPredicate:predicate];
    
    return [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                               managedObjectContext:context
                                                 sectionNameKeyPath:keyPath
                                                          cacheName:nil];
}

@end

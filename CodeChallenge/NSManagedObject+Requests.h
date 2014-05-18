//
//  NSManagedObject+Requests.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Requests)

+ (NSFetchRequest *) requestInContext:(NSManagedObjectContext *)context;

+ (NSFetchRequest *) requestWithPredicate:(NSPredicate *)searchTerm
                                inContext:(NSManagedObjectContext *)context;

+ (NSFetchedResultsController *)resultsControllerWithPredicate:(NSPredicate*)predicate
                                                      sortedBy:(NSString *)sortKey
                                                     ascending:(BOOL)ascending
                                            sectionNameKeyPath:(NSString*)keyPath
                                                     inContext:(NSManagedObjectContext*)context;

@end

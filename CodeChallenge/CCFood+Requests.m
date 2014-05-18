//
//  CCFood+Requests.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "CCFood+Requests.h"
#import "LocaleSettings.h"
#import "CCCategory+Requests.h"

@implementation CCFood (Requests)

+ (NSFetchedResultsController *)resultsControllerInContext:(NSManagedObjectContext*)context
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"language == %@", [LocaleSettings sharedInstance].currentLanguage];
    NSString *keyPath = [NSString stringWithFormat:@"category.%@", [CCCategory sortingKeyPath]];
    
    NSFetchRequest *request = [self requestInContext:context];
    [request setSortDescriptors:
     @[[[NSSortDescriptor alloc] initWithKey:keyPath ascending:YES],
       [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES]]];
    
    [request setPredicate:predicate];
    
    return [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                               managedObjectContext:context
                                                 sectionNameKeyPath:keyPath
                                                          cacheName:nil];
}

@end

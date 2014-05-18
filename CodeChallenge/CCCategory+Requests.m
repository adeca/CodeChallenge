//
//  CCCategory+Requests.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "CCCategory+Requests.h"
#import "LocaleSettings.h"
#import "CCCategoryName.h"

@implementation CCCategory (Requests)

+ (NSFetchedResultsController *)resultsControllerInContext:(NSManagedObjectContext*)context
{
    NSString *keyPath = [self sortingKeyPath];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K != nil", keyPath];
    
    return [self resultsControllerWithPredicate:predicate
                                       sortedBy:keyPath
                                      ascending:YES
                             sectionNameKeyPath:nil
                                      inContext:context];
}

+ (NSString*)sortingKeyPath
{
    return [NSString stringWithFormat:@"name.%@", [LocaleSettings sharedInstance].currentLanguage];
}

@end

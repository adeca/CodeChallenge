//
//  FoodViewModel.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "FoodViewModel.h"
#import "DataManager.h"
#import "CCFood+Requests.h"
#import "LocaleSettings.h"

@interface FoodViewModel () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResults;

@end

@implementation FoodViewModel

- (id)init
{
    if (self = [super init]) {
        [self loadFetchedResults];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(languageChanged:)
                                                     name:LocaleSettingsChangedNotification
                                                   object:nil];
    }
    return self;
}

- (void)loadFetchedResults
{
    self.fetchedResults.delegate = nil;
    self.fetchedResults = [CCFood resultsControllerInContext:[DataManager sharedInstance].mainContext];
    self.fetchedResults.delegate = self;
    [self.fetchedResults performFetch:nil];
}

- (void)dealloc
{
    self.fetchedResults.delegate = nil;
}

- (NSArray*)foodItems
{
    return [self.fetchedResults.sections valueForKey:@"objects"];
}

- (NSUInteger)numberOfSections
{
    return self.fetchedResults.sections.count;
}
- (NSUInteger)countForSection:(NSUInteger)section
{
    return [self.fetchedResults.sections[section] numberOfObjects];
}
- (NSString*)titleForSection:(NSUInteger)section
{
    return [self.fetchedResults.sections[section] name];
}
- (NSArray*)objectsForSection:(NSUInteger)section
{
    return [self.fetchedResults.sections[section] objects];
}
- (CCFood*)foodItemForIndexPath:(NSIndexPath*)indexPath
{
    return [self.fetchedResults objectAtIndexPath:indexPath];
}

#pragma mark - Notifications

- (void)languageChanged:(NSNotification*)notification
{
    [self willChangeValueForKey:@"foodItems"];
    [self loadFetchedResults];
    [self didChangeValueForKey:@"foodItems"];
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self willChangeValueForKey:@"foodItems"];
}
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self didChangeValueForKey:@"foodItems"];
}

@end

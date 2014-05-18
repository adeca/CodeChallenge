//
//  CategoriesViewModel.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "CategoriesViewModel.h"
#import "DataManager.h"
#import "CCCategory+Requests.h"
#import "LocaleSettings.h"

@interface CategoriesViewModel () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResults;

@end

@implementation CategoriesViewModel

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
    self.fetchedResults = [CCCategory resultsControllerInContext:[DataManager sharedInstance].mainContext];
    self.fetchedResults.delegate = self;
    [self.fetchedResults performFetch:nil];
}

- (void)dealloc
{
    self.fetchedResults.delegate = nil;
}

- (NSArray*)categories
{
    return self.fetchedResults.fetchedObjects;
}

#pragma mark - Notifications

- (void)languageChanged:(NSNotification*)notification
{
    [self willChangeValueForKey:@"categories"];
    [self loadFetchedResults];
    [self didChangeValueForKey:@"categories"];
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller;
{
    [self willChangeValueForKey:@"categories"];
}
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self didChangeValueForKey:@"categories"];
}

@end

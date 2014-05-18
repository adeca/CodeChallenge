//
//  ExercisesViewModel.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "ExercisesViewModel.h"
#import "DataManager.h"
#import "CCExercise+Requests.h"
#import "LocaleSettings.h"

@interface ExercisesViewModel () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResults;

@end

@implementation ExercisesViewModel

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
    self.fetchedResults = [CCExercise resultsControllerInContext:[DataManager sharedInstance].mainContext];
    self.fetchedResults.delegate = self;
    [self.fetchedResults performFetch:nil];
}

- (void)dealloc
{
    self.fetchedResults.delegate = nil;
}

- (NSArray*)exercises
{
    return self.fetchedResults.fetchedObjects;
}

#pragma mark - Notifications

- (void)languageChanged:(NSNotification*)notification
{
    [self willChangeValueForKey:@"exercises"];
    [self loadFetchedResults];
    [self didChangeValueForKey:@"exercises"];
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller;
{
    [self willChangeValueForKey:@"exercises"];
}
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self didChangeValueForKey:@"exercises"];
}

@end

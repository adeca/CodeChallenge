//
//  ExercisesViewController.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "ExercisesViewController.h"
#import "ExercisesViewModel.h"
#import "ExerciseCell.h"

@interface ExercisesViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) ExercisesViewModel *viewModel;

@end

@implementation ExercisesViewController

- (void)dealloc
{
    [[MAKVONotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewModel = [[ExercisesViewModel alloc] init];
    [self.viewModel addObserver:self
                        keyPath:@"exercises"
                       selector:@selector(exercisesChanged:)
                       userInfo:nil
                        options:0];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [self.tableView reloadData];
}

#pragma mark - KVO

- (void)exercisesChanged:(MAKVONotification*)notification
{
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.exercises.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExerciseCell *cell = [ExerciseCell dequeueReusableCellFromTableView:tableView forIndexPath:indexPath];
    [cell configureWithExercise:self.viewModel.exercises[indexPath.row]];
    
    return cell;
}

@end

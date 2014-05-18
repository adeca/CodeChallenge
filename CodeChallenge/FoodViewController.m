//
//  FoodViewController.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "FoodViewController.h"
#import "FoodViewModel.h"
#import "FoodCell.h"

@interface FoodViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityView;

@property (nonatomic, strong) FoodViewModel *viewModel;

@end

@implementation FoodViewController

- (void)dealloc
{
    [[MAKVONotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewModel = [[FoodViewModel alloc] init];
    [self.viewModel addObserver:self
                        keyPath:@"foodItems"
                       selector:@selector(foodItemsChanged:)
                       userInfo:nil
                        options:0];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [self reloadData];
}

- (void)reloadData
{
    [self.tableView reloadData];
    if (self.tableView.numberOfSections > 0) {
        [self.activityView stopAnimating];
        self.tableView.hidden = NO;
    } else {
        [self.activityView startAnimating];
        self.tableView.hidden = YES;
    }
}

#pragma mark - KVO

- (void)foodItemsChanged:(MAKVONotification*)notification
{
    [self reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.viewModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel countForSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.viewModel titleForSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodCell *cell = [FoodCell dequeueReusableCellFromTableView:tableView forIndexPath:indexPath];
    
    CCFood *foodItem = [self.viewModel foodItemForIndexPath:indexPath];
    [cell configureWithFoodItem:foodItem];
    
    return cell;
}

@end

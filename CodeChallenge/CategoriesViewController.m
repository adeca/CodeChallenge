//
//  CategoriesViewController.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "CategoriesViewController.h"
#import "CategoriesViewModel.h"
#import "CategoryCell.h"

@interface CategoriesViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) CategoriesViewModel *viewModel;

@end

@implementation CategoriesViewController

- (void)dealloc
{
    [[MAKVONotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewModel = [[CategoriesViewModel alloc] init];
    [self.viewModel addObserver:self
                        keyPath:@"categories"
                       selector:@selector(categoriesChanged:)
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

- (void)categoriesChanged:(MAKVONotification*)notification
{
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryCell *cell = [CategoryCell dequeueReusableCellFromTableView:tableView forIndexPath:indexPath];
    [cell configureWithCategory:self.viewModel.categories[indexPath.row]];
    
    return cell;
}

@end

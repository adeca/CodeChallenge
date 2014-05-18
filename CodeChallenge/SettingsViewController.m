//
//  SettingsViewController.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsViewModel.h"

@interface SettingsViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) SettingsViewModel *viewModel;

@property (nonatomic, weak) IBOutlet UIPickerView *pickerView;

@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewModel = [[SettingsViewModel alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self reloadData];
}

- (void)reloadData
{
    [self.pickerView reloadAllComponents];
    [self.pickerView selectRow:self.viewModel.selectedLanguageIndex
                   inComponent:0
                      animated:NO];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.viewModel.languages.count;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.viewModel.languages[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self.viewModel setSelectedLanguageIndex:row];
}

@end

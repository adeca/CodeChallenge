//
//  SettingsViewModel.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "SettingsViewModel.h"
#import "LocaleSettings.h"

@implementation SettingsViewModel

- (NSArray*)languages
{
    return [LocaleSettings sharedInstance].supportedLanguages;
}

- (NSUInteger)selectedLanguageIndex
{
    return [self.languages indexOfObject:[LocaleSettings sharedInstance].currentLanguage];
}
- (void)setSelectedLanguageIndex:(NSUInteger)selectedLanguageIndex
{
    [LocaleSettings sharedInstance].currentLanguage = self.languages[selectedLanguageIndex];
}

@end

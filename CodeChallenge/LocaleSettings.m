//
//  LocaleSettings.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "LocaleSettings.h"

NSString *const LocaleSettingsChangedNotification = @"LocaleSettingsChangedNotification";

@implementation LocaleSettings

+ (instancetype)sharedInstance
{
    static LocaleSettings *sharedInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (id)init
{
    if (self = [super init]) {
        self.currentLanguage = self.defaultLanguage;
    }
    return self;
}

- (NSString*)defaultLanguage
{
    return @"en";
}
- (NSArray*)supportedLanguages
{
    return @[@"en", @"fi", @"it", @"pt", @"no", @"pl", @"da", @"nl", @"fr", @"ru", @"sv", @"es", @"de"];
}

- (void)setCurrentLanguage:(NSString *)currentLanguage
{
    if (![currentLanguage isEqual:_currentLanguage]) {
        _currentLanguage = currentLanguage;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:LocaleSettingsChangedNotification object:self];
    }
}

@end

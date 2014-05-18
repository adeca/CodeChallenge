//
//  LocaleSettings.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const LocaleSettingsChangedNotification;

@interface LocaleSettings : NSObject

+(instancetype)sharedInstance;

- (NSString*)defaultLanguage;
- (NSArray*)supportedLanguages;

@property (nonatomic, strong) NSString *currentLanguage;

@end

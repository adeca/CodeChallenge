//
//  SettingsViewModel.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsViewModel : NSObject

@property (nonatomic, readonly) NSArray *languages;
@property (nonatomic, assign) NSUInteger selectedLanguageIndex;

@end

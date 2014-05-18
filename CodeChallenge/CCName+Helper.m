//
//  CCName+Helper.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "CCName+Helper.h"
#import "CCName+Parsing.h"
#import "LocaleSettings.h"

@implementation CCName (Helper)

- (NSString*)current
{
    NSString *currentLanguage = [LocaleSettings sharedInstance].currentLanguage;
    
    if ([self respondsToSelector:NSSelectorFromString(currentLanguage)])
        return [self valueForKey:currentLanguage];
    else
        return [self valueForKey:[self.class defaultLanguage]];
}

@end

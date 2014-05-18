//
//  CCName+Parsing.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "CCName+Parsing.h"

@implementation CCName (Parsing)

+ (NSString*)defaultLanguage
{
    return @"en";
}
- (NSArray*)supportedLanguages
{
    return [self.entity.attributesByName allKeys];
}

- (void)populateWithDictionary:(NSDictionary*)dictionary
                     keyPrefix:(NSString*)keyPrefix
                    defaultKey:(NSString*)defaultKey
{
    for (NSString *language in self.supportedLanguages) {
        
        NSString *keyName = (keyPrefix.length ?
                             [NSString stringWithFormat:@"%@%@", keyPrefix, language] :
                             language);
        
        NSString *value = dictionary[keyName];
        [self setValue:value forKey:language];
    }
    
    NSString *defaultLanguage = [self class].defaultLanguage;
    if (defaultKey.length && defaultLanguage.length) {
        
        NSString *defaultValue = dictionary[defaultKey];
        [self setValue:defaultValue forKey:defaultLanguage];
    }
//    NSLog(@"%@", self);
}

- (void)populateWithDictionary:(NSDictionary*)dictionary
{
    return [self populateWithDictionary:dictionary keyPrefix:nil defaultKey:nil];
}

@end

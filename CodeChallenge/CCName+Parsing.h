//
//  CCName+Parsing.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "CCName.h"
#import "NSManagedObject+Parsing.h"

@interface CCName (Parsing)

/**
 The receiver's default language. (e.g. 'en')
 */
+ (NSString*)defaultLanguage;
/**
 All supported languages.
 */
- (NSArray*)supportedLanguages;

/**
 Populate the receiver with localized data found in dictionary, based on the provided key-name settings.
 
 @param dictionary  the dictionary to read the data from
 @param keyPrefix   a prefix common to all the localized keys. The language name will be 
                    appended to this prefix in order to obtain the actual values.
 @param defaultKey  custom key name to use instead of the prefixed key for loading the default language.
 */
- (void)populateWithDictionary:(NSDictionary*)dictionary
                     keyPrefix:(NSString*)keyPrefix
                    defaultKey:(NSString*)defaultKey;

@end

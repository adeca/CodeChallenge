//
//  FileSystemHelper.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileSystemHelper : NSObject

+ (instancetype)helper;

- (BOOL)deleteFileAtPath:(NSString*)filePath;

- (NSString*)documentsPath;
- (NSURL*)documentsURL;

@end

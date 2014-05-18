//
//  FileSystemHelper.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "FileSystemHelper.h"

@implementation FileSystemHelper

+ (instancetype)helper
{
    return [[self alloc] init];
}

- (BOOL)deleteFileAtPath:(NSString*)filePath
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    BOOL fileExists = [fileManager fileExistsAtPath:filePath];
    if (!fileExists)
        return YES;
    
    NSError *error = nil;
    if(![fileManager removeItemAtPath:filePath error:&error]) {
        NSLog(@"ERROR: unable to delete file at %@", filePath);
        return NO;
    }
    return YES;
}

- (NSString*)documentsPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}
- (NSURL*)documentsURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end

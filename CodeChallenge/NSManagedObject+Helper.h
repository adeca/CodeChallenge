//
//  NSManagedObject+Helper.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Helper)

+ (instancetype)createInContext:(NSManagedObjectContext *)context;

- (instancetype)inContext:(NSManagedObjectContext *)context;
- (instancetype)inMainContext;

+ (NSEntityDescription *)entityDescriptionInContext:(NSManagedObjectContext *)context;
+ (NSString *)entityName;

@end

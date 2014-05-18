//
//  NSManagedObject+Helper.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "NSManagedObject+Helper.h"
#import "DataManager.h"

@implementation NSManagedObject (Helper)

+ (instancetype)createInContext:(NSManagedObjectContext *)context
{
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
}

- (instancetype)inContext:(NSManagedObjectContext *)context
{
    if (context == self.managedObjectContext)
        return self;
    
    return [context objectWithID:self.objectID];
}

- (instancetype)inMainContext
{
    return [self inContext:[DataManager sharedInstance].mainContext];
}

+ (NSEntityDescription *)entityDescriptionInContext:(NSManagedObjectContext *)context
{
    return [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:context];
}

+ (NSString *)entityName
{
    return NSStringFromClass(self);
}

@end

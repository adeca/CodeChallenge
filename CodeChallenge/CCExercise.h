//
//  CCExercise.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CCExerciseName;

@interface CCExercise : NSManagedObject

@property (nonatomic, retain) NSNumber * oid;
@property (nonatomic, retain) NSNumber * hidden;
@property (nonatomic, retain) NSNumber * deleted;
@property (nonatomic, retain) NSNumber * downloaded;
@property (nonatomic, retain) NSNumber * photoVersion;
@property (nonatomic, retain) NSNumber * custom;
@property (nonatomic, retain) NSDate * lastUpdated;
@property (nonatomic, retain) NSNumber * addedByUser;
@property (nonatomic, retain) NSNumber * calories;
@property (nonatomic, retain) CCExerciseName *name;

@end

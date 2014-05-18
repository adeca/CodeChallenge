//
//  CCExerciseName.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CCName.h"

@class CCExercise;

@interface CCExerciseName : CCName

@property (nonatomic, retain) CCExercise *exercise;

@end

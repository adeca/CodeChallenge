//
//  ExerciseCell.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "ExerciseCell.h"
#import "CCExercise.h"
#import "CCExerciseName.h"
#import "CCName+Helper.h"

@implementation ExerciseCell

- (void)configureWithExercise:(CCExercise*)exercise
{
    self.textLabel.text = exercise.name.current;
//    self.detailTextLabel.text = [exercise.oid description];
}

@end

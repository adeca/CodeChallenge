//
//  ExerciseCell.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCExercise;

@interface ExerciseCell : UITableViewCell

- (void)configureWithExercise:(CCExercise*)exercise;

@end

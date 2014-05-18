//
//  FoodCell.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCFood;

@interface FoodCell : UITableViewCell

- (void)configureWithFoodItem:(CCFood*)foodItem;

@end

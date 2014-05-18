//
//  FoodCell.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "FoodCell.h"
#import "CCFood.h"
#import "CCCategory.h"

@implementation FoodCell

- (void)configureWithFoodItem:(CCFood*)foodItem
{
    self.textLabel.text = foodItem.title;
//    self.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%@)",
//                                 [foodItem.oid description], [foodItem.category.oid description]];
}

@end

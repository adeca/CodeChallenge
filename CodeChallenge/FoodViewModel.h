//
//  FoodViewModel.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CCFood;

@interface FoodViewModel : NSObject

@property (nonatomic, readonly) NSArray *foodItems;

- (NSUInteger)numberOfSections;
- (NSUInteger)countForSection:(NSUInteger)section;
- (NSString*)titleForSection:(NSUInteger)section;
- (NSArray*)objectsForSection:(NSUInteger)section;
- (CCFood*)foodItemForIndexPath:(NSIndexPath*)indexPath;

@end

//
//  CategoryCell.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "CategoryCell.h"
#import "CCCategory.h"
#import "CCCategoryName.h"
#import "CCName+Helper.h"

@implementation CategoryCell

- (void)configureWithCategory:(CCCategory*)category
{
    self.textLabel.text = category.name.current;
//    self.detailTextLabel.text = [category.oid description];
}

@end

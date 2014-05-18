//
//  CategoryCell.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCCategory;

@interface CategoryCell : UITableViewCell

- (void)configureWithCategory:(CCCategory*)category;

@end

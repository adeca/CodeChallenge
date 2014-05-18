//
//  CCCategoryName.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CCName.h"

@class CCCategory;

@interface CCCategoryName : CCName

@property (nonatomic, retain) CCCategory *category;

@end

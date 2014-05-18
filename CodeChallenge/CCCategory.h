//
//  CCCategory.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CCCategoryName, CCFood;

@interface CCCategory : NSManagedObject

@property (nonatomic, retain) NSNumber * oid;
@property (nonatomic, retain) NSDate * lastUpdated;
@property (nonatomic, retain) NSNumber * servingsCategory;
@property (nonatomic, retain) NSNumber * headCategory;
@property (nonatomic, retain) NSNumber * photoVersion;
@property (nonatomic, retain) CCCategoryName *name;
@property (nonatomic, retain) NSSet *food;
@end

@interface CCCategory (CoreDataGeneratedAccessors)

- (void)addFoodObject:(CCFood *)value;
- (void)removeFoodObject:(CCFood *)value;
- (void)addFood:(NSSet *)values;
- (void)removeFood:(NSSet *)values;

@end

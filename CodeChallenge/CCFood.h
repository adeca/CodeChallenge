//
//  CCFood.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CCCategory;

@interface CCFood : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * downloaded;
@property (nonatomic, retain) NSString * language;
@property (nonatomic, retain) NSString * locale;
@property (nonatomic, retain) NSNumber * sourceId;
@property (nonatomic, retain) NSNumber * showMeasurement;
@property (nonatomic, retain) NSNumber * cholesterol;
@property (nonatomic, retain) NSNumber * gramsPerServing;
@property (nonatomic, retain) NSNumber * sugar;
@property (nonatomic, retain) NSNumber * fiber;
@property (nonatomic, retain) NSDate * lastUpdated;
@property (nonatomic, retain) NSNumber * addedByUser;
@property (nonatomic, retain) NSNumber * fat;
@property (nonatomic, retain) NSNumber * sodium;
@property (nonatomic, retain) NSNumber * deleted;
@property (nonatomic, retain) NSNumber * hidden;
@property (nonatomic, retain) NSNumber * custom;
@property (nonatomic, retain) NSNumber * calories;
@property (nonatomic, retain) NSNumber * oid;
@property (nonatomic, retain) NSNumber * servingsCategory;
@property (nonatomic, retain) NSNumber * saturatedFat;
@property (nonatomic, retain) NSNumber * potasium;
@property (nonatomic, retain) NSString * brand;
@property (nonatomic, retain) NSNumber * carbohydrates;
@property (nonatomic, retain) NSNumber * protein;
@property (nonatomic, retain) NSNumber * defaultSize;
@property (nonatomic, retain) NSNumber * unsaturatedFat;
@property (nonatomic, retain) NSNumber * gramsPerMilliliter;
@property (nonatomic, retain) NSString * pieceDescription;
@property (nonatomic, retain) NSNumber * gramsPerPiece;
@property (nonatomic, retain) NSNumber * typeOfMeasurement;
@property (nonatomic, retain) NSNumber * showOnlySameType;
@property (nonatomic, retain) CCCategory *category;

@end

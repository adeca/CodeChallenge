//
//  CCFood+Requests.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "CCFood.h"

@interface CCFood (Requests)

+ (NSFetchedResultsController *)resultsControllerInContext:(NSManagedObjectContext*)context;

@end

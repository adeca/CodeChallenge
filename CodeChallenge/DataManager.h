//
//  DataManager.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

- (void)setupCoreDataStack;
- (void)clearCoreDataStack;

@property (nonatomic, readonly) NSManagedObjectContext* mainContext;

/**
 Creates a new context associated with a background thread.
 
 The context will be configured with the current peristent store instance, and any changes saved 
 will be reflected in the main context.
 */
- (NSManagedObjectContext*)createBackgroundContext;

/**
 Convenience method for performing CoreData operations in a background thread.
 
 @param block   This block will get called in a private queue associated with the 'context' parameter it
 receives. All CoreData operations inside the block should use this particular context. Setting a non-nil
 value in *pError will abort the operation and execute the completion handler with an error status.
 Returning normally will execute the completion block with a successful status.
 
 @param completion  This block will be called on the main queue after executing the 'block' action.
 */

- (void)performInBackground:(void(^)(NSManagedObjectContext *context, NSError **pError))block
                 completion:(void(^)(BOOL success, NSError *error))completion;

/**
 Convenience method for performing CoreData operations in a background thread.
 
 These methods work like the 'performInBackground' method but they also save the context before calling
 the completion block.
 
 @param block   This block will get called in a private queue associated with the 'context' parameter it
 receives. All CoreData operations inside the block should use this particular context. Setting a non-nil
 value in *pError will abort the operation and execute the completion handler with an error status.
 Returning normally will cause the context to be saved and the completion block to be called.
 
 @param completion  This block will be called on the main queue after executing the 'block' action
 and saving the context.
 */

- (void)performAndSaveInBackground:(void(^)(NSManagedObjectContext *context, NSError **pError))block
                        completion:(void(^)(BOOL success, NSError *error))completion;

/**
 Access the shared DataManager instance.
 
 Only one CoreData stack will be active during the application lifetime.
 */
+ (instancetype)sharedInstance;

@end

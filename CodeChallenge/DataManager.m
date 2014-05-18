//
//  DataManager.m
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "DataManager.h"
#import "FileSystemHelper.h"

@interface DataManager ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation DataManager

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Setup

- (void)setupCoreDataStack
{
#ifdef DEBUG
    [self clearCoreDataStack];
#endif
    
    self.managedObjectContext = nil;
    self.managedObjectModel = nil;
    self.persistentStoreCoordinator = nil;
    
    [self createManagedObjectContextWithStoreCoordinator:
     [self createPersistentStoreCoordinatorWithModel:
      [self createManagedObjectModel]]];
}
- (void)clearCoreDataStack
{
    self.managedObjectContext = nil;
    self.managedObjectModel = nil;
    self.persistentStoreCoordinator = nil;
    
    [[FileSystemHelper helper] deleteFileAtPath:self.databaseURL.path];
}

- (NSManagedObjectContext*)createManagedObjectContextWithStoreCoordinator:(NSPersistentStoreCoordinator*)coordinator
{
    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.managedObjectContext.undoManager = nil; // disable unused feature
    self.managedObjectContext.persistentStoreCoordinator = coordinator;
    
    return self.managedObjectContext;
}

- (NSPersistentStoreCoordinator*)createPersistentStoreCoordinatorWithModel:(NSManagedObjectModel*)model
{
    self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    NSError *error = nil;
    if (![self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                       configuration:nil
                                                                 URL:self.databaseURL
                                                             options:@{
                                                                       NSMigratePersistentStoresAutomaticallyOption:@YES,
                                                                       NSInferMappingModelAutomaticallyOption:@YES
                                                                       }
                                                               error:&error])
    {
        NSLog(@"Unresolved Core Data error: %@; %@. Likely caused by existing database being unupgradable.", error, [error userInfo]);
        // TODO: handle this error gracefully
        abort();
    }
    
    return self.persistentStoreCoordinator;
}

- (NSManagedObjectModel*)createManagedObjectModel
{
    self.managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
    
    return self.managedObjectModel;
}

#pragma mark - File Locations

- (NSString*)databaseFileName
{
    return @"CodeChallenge.sqlite";
}
- (NSURL*)databaseURL
{
    return [[FileSystemHelper helper].documentsURL URLByAppendingPathComponent:self.databaseFileName];
}

- (NSString*)modelFileName
{
    return @"CodeChallenge";
}
- (NSURL*)modelURL
{
    return [[NSBundle mainBundle] URLForResource:self.modelFileName withExtension:@"momd"];
}

#pragma mark - Context Creation

- (NSManagedObjectContext*)mainContext
{
    return self.managedObjectContext;
}

- (NSManagedObjectContext*)createBackgroundContext
{
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    context.undoManager = nil;
    context.persistentStoreCoordinator = self.persistentStoreCoordinator;
    
    // track changes saved in the background context in order to merge them into the main context
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(backgroundContextDidSave:)
                                                 name:NSManagedObjectContextDidSaveNotification
                                               object:context];
    
    return context;
}

- (void)backgroundContextDidSave:(NSNotification*)notification
{
    if ([NSThread isMainThread]) {
        [self.managedObjectContext mergeChangesFromContextDidSaveNotification:notification];
        return;
    }
    
    // merge syncronously to avoid race conditions
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.managedObjectContext mergeChangesFromContextDidSaveNotification:notification];
    });
}

#pragma mark - Background Operations

- (void)performInBackground:(void(^)(NSManagedObjectContext *context, NSError **pError))block
                 completion:(void(^)(BOOL success, NSError *error))completion
{
    NSManagedObjectContext *context = [self createBackgroundContext];
    [context performBlock:^{
        
        NSError *error = nil;
        if (block)
            block(context, &error);

        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion)
                completion((error == nil), error);
        });
    }];
}

- (void)performAndSaveInBackground:(void(^)(NSManagedObjectContext *context, NSError **pError))block
                        completion:(void(^)(BOOL success, NSError *error))completion
{
    NSManagedObjectContext *context = [self createBackgroundContext];
    [context performBlock:^{
        
        NSError *error = nil;
        if (block)
            block(context, &error);
        
        // abort early on any errors; avoid saving the changes
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion)
                    completion(NO, error);
            });
            return;
        }
        
        // save changes if needed
        BOOL success = ([context hasChanges] ? ![context save:&error] : YES);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion)
                completion(success, error);
        });
    }];
}

#pragma mark - Singleton

+ (instancetype)sharedInstance
{
    static DataManager *sharedInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

@end

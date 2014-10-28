//
//  AppDelegate.h
//  walky
//
//  Created by Steve Music on 10/25/14.
//  Copyright (c) 2014 Steve Music. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//for core data
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end


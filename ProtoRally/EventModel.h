//
//  EventModel.h
//  ProtoRally
//
//  Created by bobz on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "EventEntryVC.h"

@class EventModel;

@protocol CoreDataDelegate
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
-(void)saveContext;
-(NSURL *)applicationDocumentsDirectory;
@end

@protocol EventModelListener
- (void)updateFromEventModel:(EventModel *)eventModel;
@end

@interface EventModel : NSObject <EventEntryDelegate, CoreDataDelegate>
{
    
}

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

-(void)saveContext;
-(NSURL *)applicationDocumentsDirectory;
-(void)addEventModelListener:(NSObject <EventModelListener> *)eventModelListener;

@end

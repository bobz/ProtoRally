//
//  EventModel.h
//  ProtoRally
//
//  Created by bobz on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Event.h"

@class EventModel;

@protocol CoreDataDelegate
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
-(void)saveContext;
-(NSURL *)applicationDocumentsDirectory;
@end

@protocol EventModelUpdatedListener
- (void)updateFromEventModel:(EventModel *)eventModel;
@end

@protocol EventEntryDelegate
- (void)addNewEventOfType:(NSString *) eventType;
- (void)resetAllEvents;
@end

@protocol ActiveEventChangedListener
- (void)activeEventChanged:(Event *)event;
@end


@interface EventModel : NSObject <EventEntryDelegate, CoreDataDelegate>
{
    
}

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) Event *activeEvent;


-(void)saveContext;
-(NSURL *)applicationDocumentsDirectory;
-(void)addEventModelListener:(NSObject *)eventModelListener;
-(Event *)eventForIndex:(NSNumber *)index;
-(void)addNewEventOfType:(NSString *)eventType;
@end

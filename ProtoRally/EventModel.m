//
//  EventModel.m
//  ProtoRally
//
//  Created by bobz on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventModel.h"
#import "Event.h"
#import "EventEntryVC.h"

@interface EventModel()
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain, readonly) NSMutableSet *listeners;
@property (nonatomic, retain) NSNumber *counter;
@end

@implementation EventModel

@synthesize counter = _counter;
@synthesize listeners = _listeners;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize activeEvent = _activeEvent;

-(void)resetAllEvents
{
    NSArray *stores = [self.persistentStoreCoordinator persistentStores];
    
    for(NSPersistentStore *store in stores) {
        [self.persistentStoreCoordinator removePersistentStore:store error:nil];
        [[NSFileManager defaultManager] removeItemAtPath:store.URL.path error:nil];
    }
    self.persistentStoreCoordinator = nil;
    self.managedObjectContext = nil;
    self.managedObjectModel = nil;
    self.activeEvent = nil;
//    [_persistentStoreCoordinator release]; _persistentStoreCoordinator = nil;
    for (NSObject *listener in self.listeners) {
        if ([listener conformsToProtocol:@protocol(EventModelUpdatedListener) ])
        {
            [((id<EventModelUpdatedListener>) listener) updateFromEventModel:self];
        }
    }
}

-(void)setActiveEvent:(Event *)event
{
    NSLog(@"Setting Active Event to %@", event.eventIndex);

    [_activeEvent release];
    _activeEvent = event;
    [_activeEvent retain];
        
    for (NSObject *listener in self.listeners) {
        if ([listener conformsToProtocol:@protocol(ActiveEventChangedListener) ])
        {
            [((id<ActiveEventChangedListener>) listener) activeEventChanged:event];
        }
    }
}


-(Event *)newIndexedEvent
{
    Event *event = nil;
    event = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    event.eventIndex = self.counter;
    event.type = @"Default Type";
    
    self.counter  = [NSNumber numberWithInt:[self.counter intValue] +1];
    
    return event;
}

-(Event *)eventForIndex:(NSNumber *)eventIndex
{
    Event *event = nil;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    request.predicate = [NSPredicate predicateWithFormat:@"eventIndex = %@", eventIndex];
    
    NSError *error = nil;
    event = [[self.managedObjectContext executeFetchRequest:request error:&error] lastObject];
    
    if (!error && !event)
    {
        event = [self newIndexedEvent];
    }
    
    return event;
}

-(Event *)newEventOfType:(NSString *)eventType
{
    Event *event = [self newIndexedEvent];
    event.type = eventType;
    
    return event;
}


-(void)addNewEventOfType:(NSString *)eventType
{
    [self setActiveEvent: [self newEventOfType:eventType]];
}

-(void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }

}

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */


- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil)
    {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}


#pragma mark - Core Data stack


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ProtoRally" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return _managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ProtoRally.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSMutableSet *)listeners
{
    if (_listeners != nil)
    {
        return _listeners;
    }
    _listeners = [[NSMutableSet alloc]init];
    return _listeners;
}

-(void)addEventModelListener:(NSObject *)eventModelListener
{
    [self.listeners addObject:eventModelListener];
}


@end

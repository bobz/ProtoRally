//
//  ProtoRallyAppDelegate.m
//  ProtoRally
//
//  Created by bobz on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ProtoRallyAppDelegate.h"
#import "EventListVC.h"
#import "EventEntryVC.h"
#import "EventDetailVC.h"
#import "Event.h"
#import "EventModel.h"
#import "EventDetailNavCon.h"

@implementation ProtoRallyAppDelegate


@synthesize window=_window;

@synthesize coreDataDelegate = _coreDataDelegate;
@synthesize eventModel = _eventModel;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    EventListVC *list = [[EventListVC alloc] initWithEventModel:self.eventModel];
    EventEntryVC *entry = [[EventEntryVC alloc] initWithEventEntryDelegate:self.eventModel];
    EventDetailVC *detail = [[EventDetailVC alloc] init];
//    detail.textField.text = @"Original Root";
    
    EventDetailNavCon *navCon = [[EventDetailNavCon alloc] initWithRootViewController:detail eventModel:self.eventModel];
    [detail release];
    [navCon setNavigationBarHidden:YES];
    
    UISplitViewController *svc2 = [[UISplitViewController alloc] init];  
    svc2.viewControllers = [NSArray arrayWithObjects:list, navCon, nil];
    [navCon release]; [list release];
    
    UISplitViewController *svc1 = [[UISplitViewController alloc] init];
    svc1.viewControllers = [NSArray arrayWithObjects:entry, svc2, nil];
    [entry release]; [svc2 release];
    
    [self.window addSubview:svc1.view];

    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)dealloc
{
    [_window release];
    [_coreDataDelegate release];
    [super dealloc];
}

- (void)awakeFromNib
{
    /*
     Typically you should set up the Core Data stack here, usually by passing the managed object context to the first view controller.
     self.<#View controller#>.managedObjectContext = self.managedObjectContext;
    */
}

- (void)saveContext
{
    [self.coreDataDelegate saveContext];
}

#pragma mark - Core Data stack
- (EventModel *)eventModel
{
    if (_eventModel != nil)
    {
        return _eventModel;
    }
    _eventModel = [[EventModel alloc]init];
    return _eventModel;
}

- (NSObject <CoreDataDelegate> *)coreDataDelegate
{
    if (_coreDataDelegate != nil)
    {
        return _coreDataDelegate;
    }
    
    _coreDataDelegate = self.eventModel;
    return _coreDataDelegate;
}

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    return self.coreDataDelegate.managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    return self.coreDataDelegate.managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    return self.coreDataDelegate.persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [self.coreDataDelegate applicationDocumentsDirectory];
}

@end

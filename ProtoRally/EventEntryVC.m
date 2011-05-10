//
//  EventEntryVC.m
//  Vocabulous
//
//  Created by bobz on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <CoreData/CoreData.h>
#import "EventEntryVC.h"

@interface EventEntryVC()
@property (retain) NSManagedObjectContext *managedObjectContext;
@property (retain) id <EventEntryDelegate> eventEntryDelegate;
@end

@implementation EventEntryVC

@synthesize eventEntryDelegate = _eventEntryDelegate;
@synthesize managedObjectContext = _managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.managedObjectContext = managedObjectContext;
    }
    return self;
}

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    self = [self initWithNibName:nil bundle:nil managedObjectContext:managedObjectContext];
    return self;
}

- (id)initWithEventEntryDelegate:(id <EventEntryDelegate>)eventEntryDelegate
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.eventEntryDelegate = eventEntryDelegate;
    }
    return self;
}

- (IBAction)addEvent:(id)sender
{
    [self.eventEntryDelegate addEvent];
}

- (IBAction)resetEvents:(id)sender
{
    [self.eventEntryDelegate resetAllEvents];
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end

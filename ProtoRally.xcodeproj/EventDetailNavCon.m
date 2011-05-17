//
//  EventDetailNavCon.m
//  ProtoRally
//
//  Created by bobz on 5/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventDetailNavCon.h"
#import "EventDetailVC.h"

@interface EventDetailNavCon()
@property (retain) EventModel *eventModel;
@end


@implementation EventDetailNavCon

@synthesize eventModel = _eventModel;

- (id)initWithRootViewController:(UIViewController *)rootViewController eventModel:(EventModel *)eventModel
{
    self = [super initWithRootViewController:rootViewController];
    if(self)
    {
        self.eventModel = eventModel;
        [eventModel addEventModelListener:self];
    }
    
    return self;
}

- (void)activeEventChanged:(Event *)event
{
    
        EventDetailVC *edvc = [[EventDetailVC alloc] initWithEvent:event];
    
    [self popToRootViewControllerAnimated:NO];
    
    [self pushViewController:edvc animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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

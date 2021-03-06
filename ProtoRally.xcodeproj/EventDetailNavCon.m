//
//  EventDetailNavCon.m
//  ProtoRally
//
//  Created by bobz on 5/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventDetailNavCon.h"
#import "EventDetailVC.h"
#import "ShotVC.h"
#import "TurnoverVC.h"
#import "StoppageVC.h"

@interface EventDetailNavCon()
@property (nonatomic, retain) EventModel *eventModel;
@property (nonatomic, retain) ShotVC *shotVC;
@property (nonatomic, retain) TurnoverVC *turnoverVC;
@property (nonatomic, retain) StoppageVC *stoppageVC;
@property (nonatomic, retain) EventDetailVC *detailVC;
@end


@implementation EventDetailNavCon

@synthesize eventModel = _eventModel;
@synthesize shotVC = _shotVC;
@synthesize turnoverVC = _turnoverVC;
@synthesize stoppageVC = _stoppageVC;
@synthesize detailVC = _detailVC;

- (id)initWithRootViewController:(UIViewController *)rootViewController eventModel:(EventModel *)eventModel
{
    self = [super initWithRootViewController:rootViewController];
    if(self)
    {
        self.eventModel = eventModel;
        self.shotVC = [[[ShotVC alloc]initWithEventModel:self.eventModel] autorelease];
        self.turnoverVC = [[[TurnoverVC alloc] initWithEventModel:self.eventModel]autorelease];
        self.stoppageVC = [[[StoppageVC alloc]initWithEventModel:self.eventModel]autorelease];
        self.detailVC = [[[EventDetailVC alloc]initWithEventModel:self.eventModel] autorelease];
        
        [eventModel addEventModelListener:self];
        
    }
    
    return self;
}

- (void)activeEventChanged:(Event *)event fromEvent:(Event *)prevEventOrNil
{
    
    EventDetailVC *edvc; // = [[EventDetailVC alloc] initWithEvent:event];
    
    if ([@"Shot" compare:event.type] == 0 )
    {
        edvc = self.shotVC;
    }
    else if ([@"Turnover" compare:event.type] == 0 )
    {
        edvc = self.turnoverVC;
    }
    else if ([@"Stoppage" compare:event.type] == 0 )
    {
        edvc = self.stoppageVC;
    }
    else
    {
        edvc = self.detailVC;
    }
    
    edvc.event = event;
    
    [self popToRootViewControllerAnimated:NO];
        
    UIViewAnimationOptions transition;
    if (prevEventOrNil && event && ([[event eventIndex] intValue] < [[prevEventOrNil eventIndex] intValue] ))
    {
        transition = UIViewAnimationOptionTransitionCurlUp;
    }
    else
    {
        transition = UIViewAnimationOptionTransitionCurlDown;
    }
    
    [UIView 
     transitionWithView:self.view 
     duration:.5
     options: transition
     animations:^{ 
         [self  
          pushViewController:edvc 
          animated:NO];
     }
     completion:NULL];
    
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

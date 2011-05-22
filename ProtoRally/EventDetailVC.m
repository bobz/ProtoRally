//
//  EventDetailVC.m
//  Vocabulous
//
//  Created by bobz on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventDetailVC.h"
#import <CoreData/CoreData.h>

@implementation EventDetailVC

@synthesize textField = _textField;
@synthesize event = _event;

- (id)initWithEvent:(Event *)event
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.event = event;
//        [eventModel addEventModelListener:self];
    }
    return self;
}

-(void)setDetail:(NSString *)detail ToValue:(NSString *)value
{
    NSLog(@"Setting [%@] to [%@]", detail, value);
}

-(void)displayEvent
{
    if (self.event)
    {
        self.textField.text =  [NSString stringWithFormat:@"Event #:%@",self.event.eventIndex];
    }
}

- (void)dealloc
{
    [super dealloc];
}

- (void)setEvent:(Event *)event
{
    if (_event != event)
    {
        [_event release];
        _event = [event retain];
        [self displayEvent];
    }
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
    [self displayEvent];
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

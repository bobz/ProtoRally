//
//  EventDetailVC.m
//  Vocabulous
//
//  Created by bobz on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventDetailVC.h"
#import <CoreData/CoreData.h>

@interface EventDetailVC()
@property (retain) EventModel *eventModel;
@end

@implementation EventDetailVC

@synthesize eventModel = _eventModel;
@synthesize textField = _textField;


- (id)initWithEventModel:(EventModel *)eventModel
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.eventModel = eventModel;
        [eventModel addEventModelListener:self];
    }
    return self;
}




- (void)activeEventChanged:(Event *)event
{
    self.textField.text = [NSString stringWithFormat:@"Event #:%@",event.eventIndex];
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

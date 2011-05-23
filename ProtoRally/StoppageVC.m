//
//  StoppageVC.m
//  ProtoRally
//
//  Created by bobz on 5/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StoppageVC.h"
#import "EventDetail.h"

@interface StoppageVC()
@property (nonatomic, retain) NSArray *stoppageTypeControlSegments;
@end

@implementation StoppageVC

NSString * const STOPPAGE_TYPE = @"StoppageType";
NSString * const ST_OUT_OF_BOUNDS = @"Out Of Bounds";
NSString * const ST_TIME_OUT = @"Time Out";
NSString * const ST_VIOLATION = @"Violation";
@synthesize stoppageTypeControl = _stoppageTypeControl;
@synthesize stoppageTypeControlSegments = _stoppageTypeControlSegments;

-(NSArray *)stoppageTypeControlSegments
{
    if (!_stoppageTypeControlSegments)
    {
        _stoppageTypeControlSegments = [[NSArray arrayWithObjects:
                                        ST_OUT_OF_BOUNDS, 
                                        ST_TIME_OUT, 
                                        ST_VIOLATION, 
                                        nil] retain];

    }
    return _stoppageTypeControlSegments;
}

-(void)setStoppageType:(id)sender
{
    if ([sender isKindOfClass:[UISegmentedControl class]])
    {
        UISegmentedControl *segCtrl = (UISegmentedControl *)sender;
        NSString *value = [segCtrl titleForSegmentAtIndex:segCtrl.selectedSegmentIndex];
        [self setDetail:STOPPAGE_TYPE ToValue:value];
    }
    else NSLog(@"Error, stoppage type from invalid ui element");
}

-(void)updateStoppageTypeUI:(NSString *)stoppageType
{
    NSUInteger index = [self.stoppageTypeControlSegments indexOfObject:stoppageType];
    if (index == NSNotFound) 
    {
        NSLog(@"Error, not a recognized stoppage type: %@", stoppageType);
    }
    [self.stoppageTypeControl setSelectedSegmentIndex:index ]; 
}

- (void)resetUI
{
    [self updateStoppageTypeUI:ST_OUT_OF_BOUNDS];
}

- (void)displayEvent
{
    for (EventDetail *ed in self.event.details) {
        if ([STOPPAGE_TYPE isEqualToString:ed.type] )
        {
            [self updateStoppageTypeUI:ed.value];
        }
        else
        {
            NSLog(@"Error, not a recognized detail");
        }
    }
    
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

//
//  StoppageVC.m
//  ProtoRally
//
//  Created by bobz on 5/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StoppageVC.h"


@implementation StoppageVC

-(void)setStoppageType:(id)sender
{
    if ([sender isKindOfClass:[UISegmentedControl class]])
    {
        UISegmentedControl *segCtrl = (UISegmentedControl *)sender;
        NSInteger index = segCtrl.selectedSegmentIndex;
        NSLog(@"button index: %d", index);
        NSString *value = [segCtrl titleForSegmentAtIndex:index];
        NSLog(@"button text: %@", value);
        
        [self setDetail:@"StoppageType" ToValue:value];
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

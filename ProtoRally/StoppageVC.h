//
//  StoppageVC.h
//  ProtoRally
//
//  Created by bobz on 5/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventDetailVC.h"

@interface StoppageVC : EventDetailVC {
    
}

//extern NSString * const STOPPAGE_TYPE;
//extern NSString * const ST_OUT_OF_BOUNDS;
//extern NSString * const ST_TIME_OUT;
//extern NSString * const ST_VIOLATION;

@property (nonatomic, retain) IBOutlet UISegmentedControl *stoppageTypeControl;

-(IBAction) setStoppageType:(id)sender;
-(void) updateStoppageTypeUI:(NSString *)stoppageType;

@end

//
//  EventEntryVC.h
//  Vocabulous
//
//  Created by bobz on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EventEntryDelegate
- (void)addEvent;
- (void)resetAllEvents;
@end

@interface EventEntryVC : UIViewController {
    
}


- (id)initWithEventEntryDelegate:(id <EventEntryDelegate>)eventEntryDelegate;

- (IBAction)addEvent:(id)sender;
- (IBAction)resetEvents:(id)sender;

@end

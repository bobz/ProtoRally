//
//  EventEntryVC.h
//  Vocabulous
//
//  Created by bobz on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventModel.h"

@interface EventEntryVC : UIViewController {
    
}


- (id)initWithEventEntryDelegate:(id <EventEntryDelegate>)eventEntryDelegate;

- (IBAction)addEvent:(id)sender;
- (IBAction)resetEvents:(id)sender;

@end

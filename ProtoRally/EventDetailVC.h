//
//  EventDetailVC.h
//  Vocabulous
//
//  Created by bobz on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "EventModel.h"

@interface EventDetailVC : UIViewController <ActiveEventChangedListener> {
    
}

@property (nonatomic, retain) IBOutlet UILabel *textField;


- (id)initWithEventModel:(EventModel *)eventModel;
- (void)activeEventChanged:(Event *)event;

@end

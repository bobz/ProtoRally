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

@interface EventDetailVC : UIViewController <EventModelUpdatedListener>{
    
}

@property (nonatomic, retain) IBOutlet UILabel *textField;
@property (nonatomic, retain) Event *event;
@property (nonatomic, retain) EventModel *eventModel;

- (id)initWithEventModel:(EventModel *)eventModel;

- (void)setDetail:(NSString *)detail ToValue:(NSString *)value;
-(void)updateFromEventModel:(EventModel *)eventModel;
@end

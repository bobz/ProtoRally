//
//  EventListVC.h
//  Vocabulous
//
//  Created by bobz on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
#import "EventModel.h"

@interface EventListVC : CoreDataTableViewController <EventModelListener>{
}

- (id)initWithEventModel:(EventModel *)eventModel;
- (void)updateFromEventModel:(EventModel *)eventModel;

@end

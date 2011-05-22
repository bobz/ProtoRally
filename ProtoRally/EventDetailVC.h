//
//  EventDetailVC.h
//  Vocabulous
//
//  Created by bobz on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventDetailVC : UIViewController {
    
}

@property (nonatomic, retain) IBOutlet UILabel *textField;
@property (nonatomic, retain) Event *event;

//- (id)initWithEvent:(Event *)event;
- (void)setDetail:(NSString *)detail ToValue:(NSString *)value;

@end

//
//  EventDetailNavCon.h
//  ProtoRally
//
//  Created by bobz on 5/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventModel.h"

@interface EventDetailNavCon : UINavigationController <ActiveEventChangedListener> {
    
}

-(id)initWithRootViewController:(UIViewController *)rootViewController eventModel:(EventModel *)eventModel;
- (void)activeEventChanged:(Event *)event;


@end

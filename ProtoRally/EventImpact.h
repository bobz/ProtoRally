//
//  EventImpact.h
//  ProtoRally
//
//  Created by bobz on 5/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event, EventDetail;

@interface EventImpact : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * scalar;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) Event * parentEvent;
@property (nonatomic, retain) EventDetail * parentDetail;

@end

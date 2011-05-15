//
//  EventDetail.h
//  ProtoRally
//
//  Created by bobz on 5/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event, EventImpact;

@interface EventDetail : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * value;
@property (nonatomic, retain) Event * parentEvent;
@property (nonatomic, retain) NSSet* detailImpacts;

@end

//
//  Event.h
//  ProtoRally
//
//  Created by bobz on 5/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class EventDetail, EventImpact;

@interface Event : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * eventIndex;
@property (nonatomic, retain) NSSet* details;
@property (nonatomic, retain) NSSet* impacts;

@end

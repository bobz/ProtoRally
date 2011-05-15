//
//  EventDetail.m
//  ProtoRally
//
//  Created by bobz on 5/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "EventDetail.h"
#import "Event.h"
#import "EventImpact.h"


@implementation EventDetail
@dynamic type;
@dynamic value;
@dynamic parentEvent;
@dynamic detailImpacts;


- (void)addDetailImpactsObject:(EventImpact *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"detailImpacts" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"detailImpacts"] addObject:value];
    [self didChangeValueForKey:@"detailImpacts" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeDetailImpactsObject:(EventImpact *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"detailImpacts" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"detailImpacts"] removeObject:value];
    [self didChangeValueForKey:@"detailImpacts" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addDetailImpacts:(NSSet *)value {    
    [self willChangeValueForKey:@"detailImpacts" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"detailImpacts"] unionSet:value];
    [self didChangeValueForKey:@"detailImpacts" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeDetailImpacts:(NSSet *)value {
    [self willChangeValueForKey:@"detailImpacts" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"detailImpacts"] minusSet:value];
    [self didChangeValueForKey:@"detailImpacts" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end

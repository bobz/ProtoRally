//
//  Event.m
//  ProtoRally
//
//  Created by bobz on 5/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Event.h"
#import "EventDetail.h"
#import "EventImpact.h"


@implementation Event
@dynamic type;
@dynamic eventIndex;
@dynamic details;
@dynamic impacts;

- (void)addDetailsObject:(EventDetail *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"details" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"details"] addObject:value];
    [self didChangeValueForKey:@"details" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeDetailsObject:(EventDetail *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"details" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"details"] removeObject:value];
    [self didChangeValueForKey:@"details" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addDetails:(NSSet *)value {    
    [self willChangeValueForKey:@"details" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"details"] unionSet:value];
    [self didChangeValueForKey:@"details" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeDetails:(NSSet *)value {
    [self willChangeValueForKey:@"details" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"details"] minusSet:value];
    [self didChangeValueForKey:@"details" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addImpactsObject:(EventImpact *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"impacts" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"impacts"] addObject:value];
    [self didChangeValueForKey:@"impacts" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeImpactsObject:(EventImpact *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"impacts" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"impacts"] removeObject:value];
    [self didChangeValueForKey:@"impacts" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addImpacts:(NSSet *)value {    
    [self willChangeValueForKey:@"impacts" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"impacts"] unionSet:value];
    [self didChangeValueForKey:@"impacts" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeImpacts:(NSSet *)value {
    [self willChangeValueForKey:@"impacts" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"impacts"] minusSet:value];
    [self didChangeValueForKey:@"impacts" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end

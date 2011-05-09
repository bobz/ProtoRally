//
//  Event.m
//  ProtoRally
//
//  Created by bobz on 5/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Event.h"


@implementation Event
@dynamic desc;

+ (Event *)eventForTesting:(NSString *)desc inManagedObjectContext:(NSManagedObjectContext *)context
{
    Event *event = nil;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:context];
    request.predicate = [NSPredicate predicateWithFormat:@"desc = %@", desc];
    
    NSError *error = nil;
    event = [[context executeFetchRequest:request error:&error] lastObject];
    
    if (!error && !event)
    {
        event = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:context];
        event.desc = desc;
    }
    
    return event;
}

@end

//
//  Event.h
//  ProtoRally
//
//  Created by bobz on 5/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject {
@private
}

+ (Event *)eventForTesting:(NSString *)desc inManagedObjectContext:(NSManagedObjectContext *)context;

@property (nonatomic, retain) NSString * desc;

@end

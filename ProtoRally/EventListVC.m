//
//  EventListVC.m
//  Vocabulous
//
//  Created by bobz on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventListVC.h"

@implementation EventListVC

- (id)initWithStyle:(UITableViewStyle)style eventModel:(EventModel *)eventModel
{
    self = [super initWithStyle:style];
    if (self) {
        [eventModel addEventModelListener:self];
        [self updateFromEventModel:eventModel];
    }
    return self;
}

- (id)initWithEventModel:(EventModel *)eventModel
{
    self = [self initWithStyle:UITableViewStylePlain eventModel:eventModel];
    return self;
}

- (void) updateFromEventModel:(EventModel *)eventModel
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:eventModel.managedObjectContext];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"desc" ascending:YES]];
    request.predicate = nil;
    request.fetchBatchSize = 20;
    
    NSFetchedResultsController *frc = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:eventModel.managedObjectContext sectionNameKeyPath:nil cacheName:@"MyEventCache"];
    [request release];
    self.fetchedResultsController = frc;
    [frc release];
}

- (void)managedObjectSelected:(NSManagedObject *)managedObject
{
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
} 

@end

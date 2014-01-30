//
//  CommentsViewController.m
//  FootBook
//
//  Created by Kagan Riedel on 1/29/14.
//  Copyright (c) 2014 Kagan Riedel. All rights reserved.
//

#import "CommentsViewController.h"
#import "Comment.h"

@interface CommentsViewController () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>
{
    __weak IBOutlet UITableView *commentsTableView;
    NSFetchedResultsController *fetchedResultsController;
}

@end

@implementation CommentsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Comment"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.photo == %@", _photo];
    fetchRequest.predicate = predicate;
    fetchRequest.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO]];
    
    fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:_photo.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    [fetchedResultsController performFetch:nil];
    fetchedResultsController.delegate = self;
}

- (IBAction)onCommentMade:(UITextField *)textField
{
    if ([textField.text isEqualToString:@""] == NO)
    {
        Comment *comment = [NSEntityDescription insertNewObjectForEntityForName:@"Comment" inManagedObjectContext:_photo.managedObjectContext];
        comment.message = textField.text;
        comment.date = [NSDate date];
        [_photo addCommentsObject:comment];
        [_photo.managedObjectContext save:nil];
        textField.text = @"";
        
//        [commentsTableView reloadData];

    }
}

-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    [commentsTableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Comment *comment = [fetchedResultsController objectAtIndexPath:indexPath];
//    Comment *comment = _photo.comments.allObjects[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentsCell"];
    cell.textLabel.text = comment.message;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
//    [dateFormatter setDateFormat:@"MM dd yyyy '-' HH:mm"];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:comment.date];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fetchedResultsController.sections[section] numberOfObjects];
//    return _photo.comments.count;
}


@end

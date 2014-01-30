//
//  CommentsViewController.m
//  FootBook
//
//  Created by Kagan Riedel on 1/29/14.
//  Copyright (c) 2014 Kagan Riedel. All rights reserved.
//

#import "CommentsViewController.h"
#import "Comment.h"

@interface CommentsViewController () <UITableViewDataSource, UITableViewDelegate>
{
    __weak IBOutlet UITableView *commentsTableView;
    
}

@end

@implementation CommentsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
        [commentsTableView reloadData];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Comment *comment = _photo.comments.allObjects[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentsCell"];
    cell.textLabel.text = comment.message;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",comment.date];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _photo.comments.count;
}


@end

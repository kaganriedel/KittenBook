//
//  DetailViewController.m
//  FootBook
//
//  Created by Kagan Riedel on 1/29/14.
//  Copyright (c) 2014 Kagan Riedel. All rights reserved.
//

#import "DetailViewController.h"
#import "User.h"
#import "PhotoCell.h"
#import "ImageViewController.h"
#import "Photo.h"
#import "CommentsViewController.h"
@import CoreData;


@interface DetailViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    __weak IBOutlet UICollectionView *detailCollectionView;
    User *user;
}

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(User*)thisUser
{
    user = thisUser;
    self.title = user.name;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ImageSegue"])
    {
        ImageViewController *vc = segue.destinationViewController;
        vc.user = user;
    }
    else if ([segue.identifier isEqualToString:@"CommentsSegue"])
    {
        CommentsViewController *vc = segue.destinationViewController;
        vc.photo = sender;
    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Photo *photo = user.photos.allObjects[indexPath.row];
    [self performSegueWithIdentifier:@"CommentsSegue" sender:photo];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flow = detailCollectionView.collectionViewLayout;
    flow.sectionInset = UIEdgeInsetsMake(12.0, 12.0, 12.0, 12.0);
    detailCollectionView.collectionViewLayout = flow;
}

-(void)viewDidAppear:(BOOL)animated
{
    [detailCollectionView reloadData];
    
    if (user.photos.count == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Kittens!" message:@"Tap the + button to give your lonely friend some kittens" delegate:nil cancelButtonTitle:@"Meow" otherButtonTitles: nil];
        [alert show];
    }

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Photo *photo = user.photos.allObjects[indexPath.row];
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageWithData:photo.image];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return user.photos.count;
}

@end

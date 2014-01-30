//
//  ImageViewController.m
//  FootBook
//
//  Created by Kagan Riedel on 1/29/14.
//  Copyright (c) 2014 Kagan Riedel. All rights reserved.
//

#import "ImageViewController.h"
#import "Photo.h"

@interface ImageViewController ()
{
    __weak IBOutlet UIImageView *image1;
    __weak IBOutlet UIImageView *image2;
    __weak IBOutlet UIImageView *image3;
    __weak IBOutlet UIImageView *image4;
}

@end

@implementation ImageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSURL *url = [NSURL URLWithString:@"http://placekitten.com/200/300"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    image1.image = [UIImage imageWithData:data];
    
    url = [NSURL URLWithString:@"http://placekitten.com/150/225"];
    data = [NSData dataWithContentsOfURL:url];
    image2.image = [UIImage imageWithData:data];

    url = [NSURL URLWithString:@"http://placekitten.com/250/375"];
    data = [NSData dataWithContentsOfURL:url];
    image3.image = [UIImage imageWithData:data];
    
    url = [NSURL URLWithString:@"http://placekitten.com/180/270"];
    data = [NSData dataWithContentsOfURL:url];
    image4.image = [UIImage imageWithData:data];
}

- (IBAction)onPick1:(id)sender
{
    Photo *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:_user.managedObjectContext];
    photo.image = UIImageJPEGRepresentation(image1.image, 0.0);
    [_user addPhotosObject:photo];
    [_user.managedObjectContext save:nil];
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)onPick2:(id)sender
{
    Photo *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:_user.managedObjectContext];
    photo.image = UIImageJPEGRepresentation(image2.image, 0.0);
    [_user addPhotosObject:photo];
    [_user.managedObjectContext save:nil];
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)onPick3:(id)sender
{
    Photo *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:_user.managedObjectContext];
    photo.image = UIImageJPEGRepresentation(image3.image, 0.0);
    [_user addPhotosObject:photo];
    [_user.managedObjectContext save:nil];
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)onPick4:(id)sender
{
    Photo *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:_user.managedObjectContext];
    photo.image = UIImageJPEGRepresentation(image4.image, 0.0);
    [_user addPhotosObject:photo];
    [_user.managedObjectContext save:nil];

    [self.navigationController popViewControllerAnimated:YES];

}




@end

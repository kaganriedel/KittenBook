//
//  Photo.h
//  FootBook
//
//  Created by Kagan Riedel on 1/29/14.
//  Copyright (c) 2014 Kagan Riedel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment, User;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSSet *comments;
@end

@interface Photo (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

@end

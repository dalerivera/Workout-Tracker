//
//  SetViewController.h
//  WorkoutTracker
//
//  Created by Dale Rivera on 7/23/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Set;
@class Exercise;
@interface SetViewController : UIViewController
@property(strong,nonatomic) Set *set;
@property(strong,nonatomic) Exercise *exercise;
@property(nonatomic) int index;
@end

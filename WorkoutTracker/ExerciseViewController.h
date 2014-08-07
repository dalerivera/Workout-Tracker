//
//  ExerciseViewController.h
//  WorkoutTracker
//
//  Created by Dale Rivera on 7/23/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Workout;
@class Exercise;
@interface ExerciseViewController : UIViewController
@property(strong,nonatomic)Workout *workout;
@property(strong,nonatomic)Exercise *exercise;
@property(strong,nonatomic)NSMutableArray *sets;
@property(nonatomic)int index;
@end

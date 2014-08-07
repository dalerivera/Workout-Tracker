//
//  CurrentWorkoutViewController.h
//  WorkoutTracker
//
//  Created by Dale Rivera on 7/23/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Workout;
@interface CurrentWorkoutViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property(strong,nonatomic) Workout *workout;
@end

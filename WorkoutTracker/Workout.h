//
//  Workout.h
//  WorkoutTracker
//
//  Created by Dale Rivera on 7/23/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Workout : NSObject
@property(nonatomic,strong) NSMutableArray *exercises;
@property(nonatomic,strong) NSString *date;
@property(nonatomic) int type;
@property(nonatomic,strong) NSString *title;
@end

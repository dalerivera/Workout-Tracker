//
//  WorkoutSingleton.m
//  WorkoutTracker
//
//  Created by Dale Rivera on 7/23/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "WorkoutSingleton.h"
#import "Workout.h"
@implementation WorkoutSingleton
@synthesize workouts;

+ (id)sharedWorkouts {
    static WorkoutSingleton *sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSingleton = [[self alloc] init];
    });
    return sharedSingleton;
}

- (WorkoutSingleton *) init {
    self.workouts = [NSMutableArray array];
    return self;
}

- (NSInteger *)getIndexForObjectWithDate:(NSString*)date {
    for (int i= 0; i<self.workouts.count;i++) {
        NSString *workoutDate = [((Workout*)self.workouts[i]) date];
        int equality = [workoutDate isEqualToString:date];
        if(equality==1) {
            return ((NSInteger *)i);
        }
    }
    return ((NSInteger *)(-1));
}


@end

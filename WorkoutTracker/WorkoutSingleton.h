//
//  WorkoutSingleton.h
//  WorkoutTracker
//
//  Created by Dale Rivera on 7/23/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Workout;
@interface WorkoutSingleton : NSObject {
    NSMutableArray *workouts;
}
@property(retain,nonatomic)NSMutableArray *workouts;
+(id)sharedWorkouts;
-(NSInteger *) getIndexForObjectWithDate:(NSString*)date;
@end

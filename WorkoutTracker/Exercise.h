//
//  Exercise.h
//  WorkoutTracker
//
//  Created by Dale Rivera on 7/23/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exercise : NSObject
@property(strong,nonatomic) NSMutableArray *sets;
@property(strong,nonatomic) NSString *name;
@end

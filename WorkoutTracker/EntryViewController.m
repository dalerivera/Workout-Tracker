//
//  EntryViewController.m
//  WorkoutTracker
//
//  Created by Dale Rivera on 7/23/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "EntryViewController.h"
#import "WorkoutSingleton.h"
#import "Workout.h"

@interface EntryViewController ()
@property(strong,nonatomic)Workout *workout;
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
- (IBAction)doneWasPressed:(id)sender;
- (IBAction)cancelWasPressed:(id)sender;

@end

@implementation EntryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM dd, yyyy"];
    if(self.workout ==nil){
        self.workout = [[Workout alloc] init];
        self.workout.date = [dateFormatter stringFromDate:[NSDate date]];
    }else {
        self.titleField.text = self.workout.title;
        self.typeSegmentedControl.selectedSegmentIndex = self.workout.type;
    }
    self.dateLabel.text = self.workout.date;
    
    // Do any additional setup after loading the view.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneWasPressed:(id)sender {
    self.workout.title = self.titleField.text;
    self.workout.date  = self.dateLabel.text;
    [[[WorkoutSingleton sharedWorkouts] workouts] addObject:self.workout];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelWasPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end

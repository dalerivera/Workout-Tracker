//
//  CurrentWorkoutViewController.m
//  WorkoutTracker
//
//  Created by Dale Rivera on 7/23/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "CurrentWorkoutViewController.h"
#import "Workout.h"
#import "Exercise.h"
#import "WorkoutSingleton.h"
#import "ExerciseViewController.h"
@interface CurrentWorkoutViewController () 
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITableView *exerciseTableView;

@end

@implementation CurrentWorkoutViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MMMM dd, yyyy"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    for (Workout *workout in [[WorkoutSingleton sharedWorkouts] workouts]) {
        if([workout.date isEqualToString:dateString]){
            self.workout = workout;
        }
    }
    //self.workout = [[[WorkoutSingleton sharedWorkouts] getObjectForDate:dateString]lastObject];
    if(self.workout == nil){
        NSLog(@"nil");
        self.workout = [[Workout alloc] init];
        self.workout.date = dateString;
        [[[WorkoutSingleton sharedWorkouts] workouts] addObject:self.workout];
    }else{
        self.titleLabel.text = self.workout.title;
    }
    self.dateLabel.text = dateString;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self.dateLabel action:@selector(pickDate)];
    
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated {
    [self.exerciseTableView reloadData];
}
- (void) pickDate {
    
}

#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.workout.exercises count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    UITableViewCell *cell = [self.exerciseTableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Exercise *exercise =[self.workout.exercises objectAtIndex:indexPath.row];
    cell.textLabel.text = exercise.name;
    NSString *setString = @"Sets";
    if([exercise.sets count] == 1){
        setString = @"Set";
    }
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d %@",[exercise.sets count], setString];
    return cell;
}

#pragma mark - Table View Delegate
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Exercise *exercise =[self.workout.exercises objectAtIndex:indexPath.row];
    [self.workout.exercises removeObjectAtIndex:indexPath.row];
    [self.exerciseTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    //[self.exerciseTableView reloadData];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"newExercise"]) {
        UINavigationController *navigationViewController = segue.destinationViewController;
        ExerciseViewController *exerciseViewController = (ExerciseViewController*)navigationViewController;
        exerciseViewController.workout = self.workout;
        exerciseViewController.exercise = [[Exercise alloc] init];
        exerciseViewController.index = [self.workout.exercises count];
    }else if([segue.identifier isEqualToString:@"editExercise"]) {
        UINavigationController *navigationViewController = segue.destinationViewController;
        ExerciseViewController *exerciseViewController = (ExerciseViewController*)navigationViewController;
        exerciseViewController.workout = self.workout;
        UITableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.exerciseTableView indexPathForCell:cell];
        exerciseViewController.index = indexPath.row;
        exerciseViewController.exercise = [self.workout.exercises objectAtIndex:indexPath.row];
    }
}


@end

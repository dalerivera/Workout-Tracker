//
//  WorkoutListTableViewController.m
//  WorkoutTracker
//
//  Created by Dale Rivera on 7/23/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "WorkoutListTableViewController.h"
#import "WorkoutSingleton.h"
#import "Workout.h"
#import "CurrentWorkoutViewController.h"
@interface WorkoutListTableViewController ()

@end

@implementation WorkoutListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[WorkoutSingleton sharedWorkouts] workouts] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [(Workout*)([[[WorkoutSingleton sharedWorkouts] workouts] objectAtIndex:indexPath.row]) date];
    
    return cell;
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"listToWorkout"]) {
        UINavigationController *navigationViewController = segue.destinationViewController;
        CurrentWorkoutViewController *workoutViewController = (CurrentWorkoutViewController*)navigationViewController;
        UITableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        workoutViewController.workout = [[[WorkoutSingleton sharedWorkouts] workouts] objectAtIndex:indexPath.row];
    }
}


@end

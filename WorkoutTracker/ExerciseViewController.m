//
//  ExerciseViewController.m
//  WorkoutTracker
//
//  Created by Dale Rivera on 7/23/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "ExerciseViewController.h"
#import "Workout.h"
#import "Exercise.h"
#import "WorkoutSingleton.h"
#import "Set.h"
#import "SetViewController.h"
@interface ExerciseViewController () <UITableViewDataSource, UITableViewDelegate>
- (IBAction)cancelWasPressed:(id)sender;
- (IBAction)doneWasPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITableView *setTableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;

@end

@implementation ExerciseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleField.text = self.exercise.name;
    if(self.exercise.name ==nil) {
        self.navigationBar.title = @"New Exercise";
    }else {
        self.navigationBar.title = self.exercise.name;

    }
    // Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated {
    [self.setTableView reloadData];
}

#pragma mark - Table View Data Source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.exercise.sets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRowAtIndex");
    UITableViewCell *cell = [self.setTableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Set *set=[self.exercise.sets objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%d lbs. x %d",set.weight,set.reps];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",set.notes];
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
    Set *set = [self.exercise.sets objectAtIndex:indexPath.row];
    [self.exercise.sets removeObjectAtIndex:indexPath.row];
    [self.setTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    //[self.setTableView reloadData];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"newSet"]){
        UINavigationController *navigationViewController = segue.destinationViewController;
        SetViewController *setViewController = (SetViewController*)navigationViewController;
        setViewController.exercise = self.exercise;
        setViewController.index = [self.exercise.sets count];
    }else if([segue.identifier isEqualToString:@"editSet"]) {
        UINavigationController *navigationViewController = segue.destinationViewController;
        SetViewController *setViewController = (SetViewController*)navigationViewController;
        setViewController.exercise = self.exercise;
        UITableViewCell *cell = sender;
        
        NSIndexPath *indexPath = [self.setTableView indexPathForCell:cell];
        setViewController.index = indexPath.row;
        setViewController.set= [self.exercise.sets objectAtIndex:indexPath.row];
    }
}


- (IBAction)cancelWasPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doneWasPressed:(id)sender {
    self.exercise.name = self.titleField.text;
    self.workout.exercises[self.index] = self.exercise;
    //NSInteger *index = [[WorkoutSingleton sharedWorkouts]getIndexForObjectWithDate:self.workout.date];
    //[[WorkoutSingleton sharedWorkouts] workouts][*index] = self.workout;
    [self.navigationController popViewControllerAnimated:YES];
}
@end

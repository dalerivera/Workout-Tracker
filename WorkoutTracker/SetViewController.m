//
//  SetViewController.m
//  WorkoutTracker
//
//  Created by Dale Rivera on 7/23/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "SetViewController.h"
#import "Set.h"
#import "Exercise.h"
@interface SetViewController ()
- (IBAction)cancelWasPressed:(id)sender;
- (IBAction)doneWasPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *repsField;
@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (weak, nonatomic) IBOutlet UITextView *notesView;

@end

@implementation SetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(self.set == nil) {
        self.set = [[Set alloc] init];
        
    }else {
        self.repsField.text = [NSString stringWithFormat:@"%d", self.set.reps];
        self.weightField.text = [NSString stringWithFormat:@"%d", self.set.weight];
        self.notesView.text =  self.set.notes;
    }
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

- (IBAction)cancelWasPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doneWasPressed:(id)sender {
    self.set.reps = [self.repsField.text intValue];
    self.set.weight = [self.weightField.text intValue];
    self.set.notes =  self.notesView.text;
    self.exercise.sets[self.index] = self.set;
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end

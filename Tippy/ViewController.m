//
//  ViewController.m
//  Tippy
//
//  Created by Mercy Bickell on 6/23/20.
//  Copyright © 2020 mercycat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //change title on navigator bar
    self.title = @"Tippy";
    
    //change height of tip segmented bar
    CGRect frame = self.tipControl.frame;
    [self.tipControl setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 56)];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //load in default tip percentage
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultTipPercentage = [defaults integerForKey:@"default_tip_percentage"];
    
    //selects segment corresponding to default tip percentage set by user
   self.tipControl.selectedSegmentIndex = defaultTipPercentage;

    //make sure bill is recalculated to reflect default settings
    // to calculate the tip based on the bill
    double bill = [self.billField.text doubleValue];
    
    //array of possible tips
    NSArray *percentages = @[@0.15, @0.2, @0.22];
    
    //acquire chosen tip percentage, and unwrap the NSNumber into a double value
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    // %.2f will make sure only two decimal places are displayed
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];;
    NSLog(@"View will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    NSLog(@"View did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    NSLog(@"View will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    NSLog(@"View did disappear");
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    
    // Keyboard will close on tap to screen
    [self.view endEditing:(YES)];
}

- (IBAction)onEdit:(id)sender {

    // to calculate the tip based on the bill
    double bill = [self.billField.text doubleValue];
    
    //array of possible tips
    NSArray *percentages = @[@0.15, @0.2, @0.22];
    
    //acquire chosen tip percentage, and unwrap the NSNumber into a double value
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    // %.2f will make sure only two decimal places are displayed
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];;
}

- (IBAction)onEditingBegin:(id)sender {
    
    //animate moving of the bill field
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 30, self.billField.frame.size.width, self.billField.frame.size.height);
    }];
    
    //causes tip amount to fade away when user clicks bill field
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 0;
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 30;
    
    //animates the moving back of the bill field
    [UIView animateWithDuration:0.2 animations:^{
        //assign new frame to update position of the bill field
        self.billField.frame = newFrame;
    }];
    
    //causes tip amount to fade back in when user clicks away from the bill field
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 1;
    }];
    
}

@end

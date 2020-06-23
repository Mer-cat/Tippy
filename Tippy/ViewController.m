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

@end

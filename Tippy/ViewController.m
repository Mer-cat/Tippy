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
    double tip = 0.2 * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%f", total];;
}

@end

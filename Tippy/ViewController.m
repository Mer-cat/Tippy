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
    self.tipLabel.text = @"$10.00";
    self.totalLabel.text = @"$10.00";
}

@end

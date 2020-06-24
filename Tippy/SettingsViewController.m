//
//  SettingsViewController.m
//  Tippy
//
//  Created by Mercy Bickell on 6/23/20.
//  Copyright © 2020 mercycat. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipDefault;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //load in default tip percentage
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultTipPercentage = [defaults integerForKey:@"default_tip_percentage"];
    
    //selects segment corresponding to default tip percentage set by user
   self.tipDefault.selectedSegmentIndex = defaultTipPercentage;

    NSLog(@"View will appear");
}

- (IBAction)changeTipDefault:(id)sender {
    
    //acquire chosen tip percentage, and unwrap the NSNumber into a double value
    NSInteger defaultTipPercentage = self.tipDefault.selectedSegmentIndex;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultTipPercentage forKey:@"default_tip_percentage"];
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

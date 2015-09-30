//
//  HYFirstViewController.m
//  HYTestDemo
//
//  Created by heyang on 15/9/29.
//  Copyright © 2015年 com.scxingdun. All rights reserved.
//

#import "HYFirstViewController.h"

@interface HYFirstViewController ()

@end

@implementation HYFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)goToTVC:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"GotoTVC" sender:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

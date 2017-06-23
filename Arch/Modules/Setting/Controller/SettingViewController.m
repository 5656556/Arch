//
//  SettingViewController.m
//  Arch
//
//  Created by jv on 2017/6/21.
//  Copyright © 2017年 jv. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)dealloc {
    
#if DEBUG
    NSLog(@"%s",__FUNCTION__);
#endif
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = nil;

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
#pragma mark - action

- (IBAction)logoutAction:(id)sender {
    
    [[UIBus sharedInstance] toLogin];

}

@end

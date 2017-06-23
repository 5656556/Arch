//
//  BaseTabBarViewController.m
//  Arch
//
//  Created by jv on 2017/6/20.
//  Copyright © 2017年 jv. All rights reserved.
//

#import "BaseTabBarViewController.h"

extern void navi(UIViewController *target, UIViewController *source);
extern void present(UIViewController *target, UIViewController *source);
extern void dismiss(UIViewController *ctrl);

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


- (void)show:(UIViewController *)ctrl {
    
    UIViewController *currentCtrl = self.selectedViewController;
    
    navi(ctrl,currentCtrl);
    
}

- (void)present:(UIViewController *)ctrl {
    
    UIViewController *currentCtrl = self.selectedViewController;
    
    present(ctrl,currentCtrl);
}

- (void)dismissAll {
    
    UIViewController *currentCtrl = self.selectedViewController;
    
    dismiss(currentCtrl);
    
}


@end

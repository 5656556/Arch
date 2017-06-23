//
//  LoginViewController.m
//  Arch
//
//  Created by jv on 2017/6/20.
//  Copyright © 2017年 jv. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)dealloc {
    
#if DEBUG
    NSLog(@"%s",__FUNCTION__);
#endif
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"login";
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden:NO];

    [super viewWillDisappear:animated];
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
- (IBAction)pushAction:(id)sender {
    
    [[UIBus sharedInstance] open:kSearchRoute];

}

- (IBAction)presentAction:(id)sender {
    
    [[UIBus sharedInstance] present:kSearchRoute];

}

- (IBAction)loginAction:(id)sender {
    
    [[UIBus sharedInstance] toMain];
    
}

@end

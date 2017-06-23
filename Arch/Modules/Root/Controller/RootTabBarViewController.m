//
//  RootTabBarViewController.m
//  Arch
//
//  Created by jv on 2017/6/20.
//  Copyright © 2017年 jv. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "BaseNavigationViewController.h"
#import "HomeViewController.h"
#import "SocialViewController.h"
#import "SettingViewController.h"


@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)dealloc {
    
#if DEBUG
    NSLog(@"%s",__FUNCTION__);
#endif
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"tabbar";
//    self.view.backgroundColor = [UIColor cyanColor];//子页面push过度有颜色问题
    self.view.backgroundColor = [UIColor whiteColor];

    HomeViewController *homeCtrl = [[HomeViewController alloc] init];
    UIImage *homeImage   = [UIImage imageNamed:@"tabbar_mainframe"];
    UIImage *homeHLImage = [UIImage imageNamed:@"tabbar_mainframeHL"];
    homeCtrl.title = @"首页";
    homeCtrl.tabBarItem = [[UITabBarItem alloc] initWithTitle:homeCtrl.title image:homeImage selectedImage:homeHLImage];
    
    SocialViewController *faxianCtrl = [[SocialViewController alloc] init];
    UIImage *faxianImage   = [UIImage imageNamed:@"tabbar_discover"];
    UIImage *faxianHLImage = [UIImage imageNamed:@"tabbar_discoverHL"];
    faxianCtrl.title = @"发现";
    faxianCtrl.tabBarItem = [[UITabBarItem alloc] initWithTitle:faxianCtrl.title image:faxianImage selectedImage:faxianHLImage];

    SettingViewController *settingCtrl = [[SettingViewController alloc] init];
    UIImage *settingImage   = [UIImage imageNamed:@"tabbar_me"];
    UIImage *settingHLImage = [UIImage imageNamed:@"tabbar_meHL"];
    settingCtrl.title = @"我";
    settingCtrl.tabBarItem = [[UITabBarItem alloc] initWithTitle:settingCtrl.title image:settingImage selectedImage:settingHLImage];
    
//    self.viewControllers = @[homeCtrl,faxianCtrl,settingCtrl];
    self.viewControllers = @[
                         [[BaseNavigationViewController alloc] initWithRootViewController:homeCtrl],
                         [[BaseNavigationViewController alloc] initWithRootViewController:faxianCtrl],
                         [[BaseNavigationViewController alloc] initWithRootViewController:settingCtrl],
                         ];

}



@end

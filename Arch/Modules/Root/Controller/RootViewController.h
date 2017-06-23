//
//  RootViewController.h
//  Arch
//
//  Created by jv on 2017/6/20.
//  Copyright © 2017年 jv. All rights reserved.
//

#import "BaseViewController.h"

@interface RootViewController : BaseViewController

@property (readonly, nonatomic) UIViewController *currentCtrl;

+ (instancetype)sharedInstance;

- (void)makeTop:(UIViewController *)newCtrl;
- (void)to:(UIViewController *)newCtrl;
- (void)present:(UIViewController *)newCtrl;

@end

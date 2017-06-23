//
//  RootViewController.m
//  Arch
//
//  Created by jv on 2017/6/20.
//  Copyright © 2017年 jv. All rights reserved.
//

#import "RootViewController.h"
#import "NavigatorProtocol.h"

void dismiss(UIViewController *ctrl);

@interface RootViewController ()


@end

@implementation RootViewController

+ (instancetype)sharedInstance {
    
    static RootViewController *__instance__;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __instance__ = [RootViewController new];
    });
    return __instance__;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[UIBus sharedInstance] toLogin];
    
}

#pragma mark - object method

- (void)makeTop:(UIViewController *)newCtrl {
    
    [_currentCtrl beginAppearanceTransition:NO animated:NO];
    [_currentCtrl willMoveToParentViewController:nil];
    [_currentCtrl.view removeFromSuperview];
    [_currentCtrl removeFromParentViewController];
    [_currentCtrl didMoveToParentViewController:nil];
    [_currentCtrl endAppearanceTransition];
    
    [newCtrl beginAppearanceTransition:YES animated:NO];
    [newCtrl willMoveToParentViewController:self];
    newCtrl.view.frame = self.view.bounds;
    [self addChildViewController:newCtrl];
    [self.view addSubview:newCtrl.view];
    [newCtrl didMoveToParentViewController:self];
    [newCtrl endAppearanceTransition];
    
    _currentCtrl = newCtrl;
}

- (void)to:(UIViewController *)newCtrl{
    
    if ([_currentCtrl respondsToSelector:@selector(show:)]) {
        
        id<NavigatorProtocol> topCtrl = (id<NavigatorProtocol>)_currentCtrl;
        [topCtrl show:newCtrl];
        
    }
    
}


- (void)present:(UIViewController *)newCtrl {
    
    if ([_currentCtrl respondsToSelector:@selector(present:)]) {
        
        id<NavigatorProtocol> topCtrl = (id<NavigatorProtocol>)_currentCtrl;
        [topCtrl present:newCtrl];
        
    }
    
}

- (void)dismissAll {
    
    if ([_currentCtrl respondsToSelector:@selector(dismissAll)]) {
        
        id<NavigatorProtocol> topCtrl = (id<NavigatorProtocol>)_currentCtrl;
        [topCtrl dismissAll];
        
    }
    
}




@end

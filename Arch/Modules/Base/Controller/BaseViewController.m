//
//  BaseViewController.m
//  Arch
//
//  Created by jv on 2017/6/20.
//  Copyright © 2017年 jv. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavigationViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - protocol

- (void)show:(UIViewController *)ctrl {
    
    navi(ctrl,self);
    
}


- (void)present:(UIViewController *)ctrl {
    
    present(ctrl,self);
    
}

void present(UIViewController *target, UIViewController *source) {
    
    
    if (source.presentedViewController) {
        
        present(target, source.presentedViewController);
        
    }else{
        
        if ([target isKindOfClass:UINavigationController.class]) {
            
            [source presentViewController:target animated:YES completion:nil];
            
        }else {
            
            BaseNavigationViewController *baseCtrl = [[BaseNavigationViewController alloc] initWithRootViewController:target];
            
            [source presentViewController:baseCtrl animated:YES completion:nil];
            
        }

    }

}


void navi(UIViewController *target, UIViewController *source) {
    
    if (source.presentedViewController) {
        navi(target, source.presentedViewController);
        return;
    }
    
    UINavigationController *navCtrl;
    
    if ([source isKindOfClass:UINavigationController.class]) {
        
        navCtrl = (UINavigationController *)source;
        
    }else{
        
        navCtrl = source.navigationController;
    }

    if (navCtrl) {
        
        [navCtrl pushViewController:target animated:YES];
        
    }else{
        
        if ([target isKindOfClass:UINavigationController.class]) {
            
            [source presentViewController:target animated:YES completion:nil];
            
        }else {
            
            BaseNavigationViewController *baseCtrl = [[BaseNavigationViewController alloc] initWithRootViewController:target];
            
            [source presentViewController:baseCtrl animated:YES completion:nil];
            
        }
        
    }
    
}

- (void)dismissAll {
    
    dismiss(self);
    
}

void dismissOneByOne(NSMutableArray *presents) {
    
    NSUInteger count = presents.count;
    
    if (count > 0) {
        
        UIViewController *lastOne = [presents lastObject];
        [presents removeLastObject];
        
        [lastOne dismissViewControllerAnimated:NO completion:^{
           
            dismissOneByOne(presents);
            
        }];
        
    }
    
}


void dismiss(UIViewController *ctrl) {
    
    NSMutableArray *presents = [NSMutableArray array];
    
    UIViewController *nextPresentCtrl = ctrl;
    
    do{
        nextPresentCtrl = nextPresentCtrl.presentedViewController;
        
        if (nextPresentCtrl) {
            [presents addObject:nextPresentCtrl];
        }
        
    }while (nextPresentCtrl);
    
    dismissOneByOne(presents);
    
    if ([ctrl isKindOfClass:UINavigationController.class]) {
        
        [(UINavigationController *)ctrl popToRootViewControllerAnimated:NO];
        
    }else{
        
        [ctrl.navigationController popToRootViewControllerAnimated:NO];
        
    }
    
}



@end

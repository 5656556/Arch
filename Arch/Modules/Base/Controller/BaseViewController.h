//
//  BaseViewController.h
//  Arch
//
//  Created by jv on 2017/6/20.
//  Copyright © 2017年 jv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigatorProtocol.h"

@interface BaseViewController : UIViewController<NavigatorProtocol>

@property (strong, nonatomic) id params;

- (void)show:(UIViewController *)ctrl;
- (void)present:(UIViewController *)ctrl;
- (void)dismissAll;


@end

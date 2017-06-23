//
//  NavigatorProtocol.h
//  Arch
//
//  Created by jv on 2017/6/22.
//  Copyright © 2017年 jv. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NavigatorProtocol <NSObject>

- (void)show:(UIViewController *)ctrl;
- (void)present:(UIViewController *)ctrl;
- (void)dismissAll;

@end

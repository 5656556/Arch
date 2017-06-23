//
//  UIBus.h
//  Arch
//
//  Created by jv on 2017/6/21.
//  Copyright © 2017年 jv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Routes.h"


@interface UIBus : NSObject

+ (instancetype)sharedInstance;

- (void)open:(NSString *)schema;
- (void)open:(NSString *)schema info:(id)info completion:(void(^)(id))completion;

- (void)present:(NSString *)schema;
- (void)dismissAll;

- (void)toMain;
- (void)toLogin;

@end

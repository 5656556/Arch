//
//  UIBus.m
//  Arch
//
//  Created by jv on 2017/6/21.
//  Copyright © 2017年 jv. All rights reserved.
//

#import "UIBus.h"
#import "RootViewController.h"
#import <MGJRouter.h>
#import "RootTabBarViewController.h"
#import "LoginViewController.h"

static NSString* const kUIBusPresent = @"kUIBusPresent";

@interface UIBus ()

@end

@implementation UIBus

+ (instancetype)sharedInstance {
    
    static UIBus *__instance__;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __instance__ = [UIBus new];
    });
    return __instance__;
}

- (id)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setup {
    
    [self _register:kSearchRoute class:@"SearchViewController"];
    
}

#pragma mark - object method

- (void)toMain {
    
    [[RootViewController sharedInstance] makeTop:[RootTabBarViewController new]];
    
}

- (void)toLogin {
    
    [[RootViewController sharedInstance] makeTop:[LoginViewController new]];
    
}


- (void)open:(NSString *)schema {
    
    [MGJRouter openURL:schema];
    
}

- (void)open:(NSString *)schema info:(id)info completion:(void(^)(id))completion{
    
    [MGJRouter openURL:schema withUserInfo:info completion:^(id result) {
        if (completion) {
            completion(result);
        }
    }];

}

- (void)present:(NSString *)schema {
    
    [MGJRouter openURL:schema withUserInfo:@{kUIBusPresent : @YES} completion:nil];

}

- (void)dismissAll {
    
    [[RootViewController sharedInstance] dismissAll];
}


#pragma mark - method

- (void)_register:(NSString *)route handler:(void(^)(NSDictionary *))handler {
    
    [MGJRouter registerURLPattern:route toHandler:^(NSDictionary *routerParameters) {
        
        if (handler) {
            handler(routerParameters);
        }
        
    }];
    
}


- (void)_register:(NSString *)route class:(NSString *)class {
    
    [MGJRouter registerURLPattern:route toHandler:^(NSDictionary *routerParameters) {
        
        Class cls = NSClassFromString(class);
        if (cls) {
            
            id obj = [cls new];
            
            if ([obj isKindOfClass:UIViewController.class]) {
                
                SEL sel = @selector(setParams:);
                if ([obj respondsToSelector:sel]) {
                    
                    IMP imp = [obj methodForSelector:sel];
                    void(*m)(id,SEL,id) = (void *)imp;
                    m(obj,sel,routerParameters);
                }
                
                if ([routerParameters[MGJRouterParameterUserInfo][kUIBusPresent] boolValue]) {
                    
                    [[RootViewController sharedInstance] present:obj];
                    
                }else {
                    
                    [[RootViewController sharedInstance] to:obj];
                    
                }
                
                
            }else {
                
#warning 未知协议
                
            }
            
        }
        
    }];

}


@end

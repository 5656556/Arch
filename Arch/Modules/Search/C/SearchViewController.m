//
//  SearchViewController.m
//  Arch
//
//  Created by jv on 2017/6/22.
//  Copyright © 2017年 jv. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)dealloc {
    
#if DEBUG
    NSLog(@"%s",__FUNCTION__);
#endif
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"搜索";
}


- (IBAction)presentAction:(id)sender {
    
    [[UIBus sharedInstance] present:kSearchRoute];

}


- (IBAction)jumpAction:(id)sender {
    
    [[UIBus sharedInstance] open:kSearchRoute];

    
}

- (IBAction)dismissAction:(id)sender {
    
    [[UIBus sharedInstance] dismissAll];

}

@end

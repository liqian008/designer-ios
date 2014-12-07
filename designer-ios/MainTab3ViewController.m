//
//  ViewController.m
//  designer-ios
//
//  Created by r on 14-12-6.
//  Copyright (c) 2014年 jINWANR. All rights reserved.
//

#import "MainTab3ViewController.h"

@interface MainTab3ViewController ()

@end

@implementation MainTab3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIImage *image = [UIImage imageNamed:@"main_tab_bg_active"];
    [image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:nil];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/27.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)gotoWebSite:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    [[UIApplication sharedApplication] openURL:url];
    
}




- (IBAction)gotoSecondVC:(UIButton *)sender {
    
    SecondVC *vc = [[SecondVC alloc] init];
    
    [CommonUtil changeWindowRootViewcontroller:vc];
    
    [vc release];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

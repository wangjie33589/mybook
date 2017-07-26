//
//  SecondVC.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/27.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "SecondVC.h"
#import "ViewController.h"
#import "MainVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gobackClick:(UIButton *)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewController *vc = [storyboard instantiateInitialViewController];
    
    [CommonUtil changeWindowRootViewcontroller:vc];
    
    
}


- (IBAction)gotoMainVC:(UIButton *)sender {
    MainVC *vc = [[MainVC alloc] init];
    
    [CommonUtil changeWindowRootViewcontroller:vc];
    
    [vc release];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

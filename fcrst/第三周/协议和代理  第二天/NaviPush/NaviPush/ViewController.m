//
//  ViewController.m
//  NaviPush
//
//  Created by sunhuayu on 15/7/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)changeColor:(UIColor *)color{
    self.view.backgroundColor = color;
}

- (IBAction)gotoSecondVC:(UIButton *)sender {
    SecondVC *vc = [[SecondVC alloc] init];
    vc.previousVC = self;
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

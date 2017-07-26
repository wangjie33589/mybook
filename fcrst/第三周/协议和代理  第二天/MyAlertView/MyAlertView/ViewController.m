//
//  ViewController.m
//  MyAlertView
//
//  Created by sunhuayu on 15/7/28.
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


- (IBAction)buttonClick:(UIButton *)sender {
    MyAlertView *alert = [[MyAlertView alloc] initWithTitle:@"改变颜色" button1:@"红" button2:@"蓝" delegate:self];
    
    [alert show];
}

//- (void)clickButtonAtIndex:(int)buttonIndex{
//    if (buttonIndex == 0) {
//        self.view.backgroundColor = [UIColor redColor];
//    }else{
//        self.view.backgroundColor = [UIColor blueColor];
//    }
//}


- (IBAction)gotoNextVC:(UIButton *)sender {
    SecondVC *vc = [[SecondVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

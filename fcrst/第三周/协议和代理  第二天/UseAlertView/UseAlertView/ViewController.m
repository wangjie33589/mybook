//
//  ViewController.m
//  UseAlertView
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


- (IBAction)buttonClick:(UIButton *)sender {
    MyAlertView *alert = [[MyAlertView alloc] initWithTitle:@"请选择你的性别" button1:@"男" button2:@"女" delegate:self];
    
    [alert show];
}

- (void)clickButtonAtIndex:(int)buttonIndex{
    if (buttonIndex == 0) {
        _label.text = @"男";
    }else{
        _label.text = @"女";
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

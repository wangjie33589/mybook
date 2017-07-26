//
//  ViewController.m
//  MemoryOther
//
//  Created by sunhuayu on 15/8/10.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc{
    [_picker release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //这个方法创建的图片不会autorelease，会被缓存在内存中。
    //[UIImage imageNamed:]
    
    
    //UIPickerView *picker = nil;
    
    //*  delegate  property必须用assign  ,防止循环引用。
    //picker.delegate
    
    
    
    
    
}


- (IBAction)gotoSecondVC:(UIButton *)sender {
    SecondVC *vc = [[SecondVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    //[vc release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

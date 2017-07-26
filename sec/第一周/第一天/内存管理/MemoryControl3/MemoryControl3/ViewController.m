//
//  ViewController.m
//  MemoryControl3
//
//  Created by sunhuayu on 15/8/10.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //凡是通过静态方法(非alloc,new,copy)创建的对象，引用计数暂时为1（autorelease）
    _p1 = [People createPeople];
    
    //[UIButton buttonWithType:]
    
    //[NSArray arrayWithObjects:, nil];
    
    //*****错误写法
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(40, 40, 40, 40);
//    button.backgroundColor = [UIColor redColor];
//    [self.view addSubview:button];
//    [button release];
    
    
    //字面量创建的字符串不需要管理引用计数。
    NSString *str = @"123";
    NSLog(@"%d",str.retainCount);
    
    //字面量创建的数组和字典，是autorelease的。
    NSArray *arr = @[@"123",@"333"];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end













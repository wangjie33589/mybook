//
//  ViewController.m
//  NotificationRemove
//
//  Created by sunhuayu on 15/8/14.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc{
    [_stu1 release];
    [_stu2 release];
    [super dealloc];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    _stu1 = [[Student alloc] init];
    _stu1.name = @"学霸";
    _stu1.hobby = @"看书";
    
    
    _stu2 = [[Student alloc] init];
    _stu2.name = @"学渣";
    _stu2.hobby = @"玩游戏";
    
    Student *stu = [[Student alloc] init];
    stu.name = @"插班生";
    stu.hobby = @"转学";
    
    [stu release];
    
    
}

- (IBAction)classoverClick:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"classover" object:self];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end








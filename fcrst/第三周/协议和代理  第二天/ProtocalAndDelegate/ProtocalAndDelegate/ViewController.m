//
//  ViewController.m
//  ProtocalAndDelegate
//
//  Created by sunhuayu on 15/7/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

#import "PlayGround.h"

#import "People.h"
#import "YingWu.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PlayGround *play = [[PlayGround alloc] init];
    
    People *p = [[People alloc] init];
    
    [play letSpeak:p];
    
    
    YingWu *ying = [[YingWu alloc] init];
    
    [play letSpeak:ying];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

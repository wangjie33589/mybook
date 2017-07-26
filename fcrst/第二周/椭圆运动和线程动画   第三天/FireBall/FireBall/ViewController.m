//
//  ViewController.m
//  FireBall
//
//  Created by 孙 化育 on 15-7-22.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _xSpeed = 5;
    _ySpeed = 5;
    
    for (int i = 0; i<30; i++) {
        UIImageView *shadowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"smokeball.png"]];
        shadowView.frame = CGRectMake(0, 0, 30-i, 30-i);
        shadowView.tag = i+1;
        [self.view addSubview:shadowView];
    }
    
    
    _fireView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fireball.png"]];
    _fireView.frame = CGRectMake(100, 200, 30, 30);
    
        //center表示view的中心点的坐标。
        //_fireView.center = CGPointMake(160, 284);
    _fireView.center = self.view.center;
    
    
    [self.view addSubview:_fireView];
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    
}

- (void)timerMethod{
    
    for (int i = 30; i>0; i--) {
        UIImageView *shadowView = (UIImageView *)[self.view viewWithTag:i];
        if (i == 1) {
            shadowView.center = _fireView.center;
        }else{
            shadowView.center = [self.view viewWithTag:i-1].center;
        }
    }
    
    //x,y坐标同时变大，相当于往右下移动。
    _fireView.center = CGPointMake(_fireView.center.x+_xSpeed, _fireView.center.y+_ySpeed);
    
    if (_fireView.center.x>=305) {
        _xSpeed = (int)-(arc4random()%4+3);
    }
    if (_fireView.center.y>=553) {
        _ySpeed = (int)-(arc4random()%4+3);
    }
    if (_fireView.center.x<=15) {
        _xSpeed = (int)arc4random()%4+3;
    }
    if (_fireView.center.y<=15) {
        _ySpeed = (int)arc4random()%4+3;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

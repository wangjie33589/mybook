//
//  ViewController.m
//  EightAnimation
//
//  Created by 孙 化育 on 15-7-23.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _currentAngle = 180;
    
    _isUp = YES;
    
    _angleSpeed = 1;
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    
}

- (void)timerMethod{
    _currentAngle += _angleSpeed;
    
    if ((int)(_currentAngle-90)%720>360) {
        float x = 160 + cos(_currentAngle/180*M_PI)*100;
        float y = 140 + sin(_currentAngle/180*M_PI)*100;
        _sunView.center = CGPointMake(x, y);
    }else{
        float x = 160 + cos(_currentAngle/180*M_PI)*100;
        float y = 340 - sin(_currentAngle/180*M_PI)*100;
        _sunView.center = CGPointMake(x, y);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

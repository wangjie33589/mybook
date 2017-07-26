//
//  ViewController.m
//  RoundAnimation
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
    
    
    _currentAngle = 0;
    _moonAngle = 0;
    
    _moonSpeed = 3/180.0*M_PI;
    
    _angleSpeed = 1.2/180.0*M_PI;
    
}

- (void)timerMethod{
        //角度自增
    _currentAngle+=_angleSpeed;
        //椭圆轨迹方程
        //x = 圆心x坐标+cos角度*长半轴
        //y = 圆心y坐标+sin角度*短半轴
    
        //设置view的旋转角度
    _earthView.transform = CGAffineTransformMakeRotation(-_currentAngle);
    
    float x = _sunView.center.x + cos(_currentAngle)*120;
    float y = _sunView.center.y + sin(_currentAngle)*80;
    
    _earthView.center = CGPointMake(x, y);
    
    
    _moonAngle += _moonSpeed;
    
    float moonX = _earthView.center.x + cos(_moonAngle)*30;
    float moonY = _earthView.center.y + sin(_moonAngle)*30;
    
    _moonView.center = CGPointMake(moonX, moonY);
    
}

- (IBAction)buttonClick:(UIButton *)sender {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }else{
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

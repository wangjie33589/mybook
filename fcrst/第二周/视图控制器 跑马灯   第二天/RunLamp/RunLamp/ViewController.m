//
//  ViewController.m
//  RunLamp
//
//  Created by 孙 化育 on 15-7-21.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        //初始运动向左，所以x坐标每次-1.
    _speed = -1;
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 50)];
    [self.view addSubview:_label];
    _label.backgroundColor = [UIColor redColor];
    
    _label.text = @"今天又失恋了，心好累，感觉不会再爱了。还是好好学IOS吧";
    [_label sizeToFit];
    
    _label.frame = CGRectMake(0, 50, _label.frame.size.width, 50);
    
    _width = _label.frame.size.width;
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
}

- (void)timerMethod{
        //每次timer调用时根据speed改变label的x坐标。
    _label.frame = CGRectMake(_label.frame.origin.x+_speed, 50, _width, 50);
    
        //当label的x坐标小于320-_width时说明已经移动到最左边，不能再往左移动，把_speed设置为1，开始向右移动。
    if (_label.frame.origin.x<=320-_width) {
        _speed = 1;
    }
    
        //当label的x坐标大于0时，说明已经移动到最右边，把speed设置为-1，往左移动。
    if (_label.frame.origin.x>=0) {
        _speed = -1;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end





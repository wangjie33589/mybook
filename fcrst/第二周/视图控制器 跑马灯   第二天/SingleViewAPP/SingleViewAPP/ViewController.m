//
//  ViewController.m
//  SingleViewAPP
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
    
    _label.text = @"今天是我第一次做跑马灯，感觉好紧张啊。怎么样才能装成经常做的样子？";
    _label.backgroundColor = [UIColor greenColor];
    
    _label.frame = CGRectMake(0, 50, 320, 50);
    
        //让label的尺寸和文本内容匹配。
    [_label sizeToFit];
    
    NSLog(@"%f",_label.frame.size.width);
    _width = _label.frame.size.width;
    _label.frame = CGRectMake(0, 50, _label.frame.size.width, 50);
    
    [self moveLeft];
}

- (void)moveLeft{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3];
        //setAnimationCurve设置动画的速率曲线。
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
        //设置动画的代理，设置代理之后，动画在某个时刻(动画结束)就会调用代理对象方法。
    [UIView setAnimationDelegate:self];
        //设置动画结束时调用的方法。
    [UIView setAnimationDidStopSelector:@selector(moveRight)];
    
    _label.frame = CGRectMake(320-_width, 50, _width, 50);
    
    [UIView commitAnimations];
}


- (void)moveRight{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(moveLeft)];
    
    _label.frame = CGRectMake(0, 50, _width, 50);
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

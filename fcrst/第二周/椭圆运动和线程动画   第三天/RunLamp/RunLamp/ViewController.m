//
//  ViewController.m
//  RunLamp
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
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 220, 50)];
    view.backgroundColor = [UIColor greenColor];
    
    view.clipsToBounds = YES;
    
    [self.view addSubview:view];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 220, 50)];
    _label.text = @"这是一个label";
    
    [_label sizeToFit];
    
    _width = _label.frame.size.width;
    
    _label.frame = CGRectMake(0, 0, _width, 50);
    [view addSubview:_label];
    
        //[self viewAnimation];
    [self timerAnimation];
}

- (void)timerMethod{
    _label.frame = CGRectMake(_label.frame.origin.x-1, 0, _width, 50);
    
    if (_label.frame.origin.x<=-_width) {
        _label.frame = CGRectMake(220, 0, _width, 50);
    }
}

- (void)timerAnimation{
    _label.frame = CGRectMake(220, 0, _width, 50);
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
}

- (void)viewAnimation{
    _label.frame = CGRectMake(220, 0, _width, 50);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(viewAnimation)];
    _label.frame = CGRectMake(-_width, 0, _width, 50);
    [UIView commitAnimations];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end











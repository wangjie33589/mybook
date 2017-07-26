//
//  ViewController.m
//  FireAnimation
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
    
    
        //[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:17];
    
    for (int i = 1; i<=17; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"campFire%d.gif",i]];
        [array addObject:img];
    }
    
        //animationImages动画图片数组，数组中存放的必须是UIImage。
    _imgView.animationImages = array;
    
        //设置单次动画的持续时间(从第一张播放到最后一张的时间)
    _imgView.animationDuration = 1;
    
        //设置动画的播放次数。0表示无限播放。
    _imgView.animationRepeatCount = 1;
    
    
        //开始动画
    [_imgView startAnimating];
    
        //停止动画
        //[_imgView stopAnimating];
}

- (void)timerMethod{
        //static表示静态变量，静态变量只会被定义一次。
    static int a = 0;
    a++;
    
    if (a>17) {
        a = 1;
    }
    
//    _count++;
//    
//    if (_count>17) {
//        _count = 1;
//    }
    
        //根据累加的变量拼接图片名字，当图片切换很快时，就形成一个动画。
    _imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"campFire%d.gif",a]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

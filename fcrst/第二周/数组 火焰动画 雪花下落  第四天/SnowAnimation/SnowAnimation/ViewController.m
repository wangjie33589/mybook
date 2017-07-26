//
//  ViewController.m
//  SnowAnimation
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
    
    _flakeArray = [[NSMutableArray alloc] initWithCapacity:20];
    
        //创建20个雪花，放入数组
    for (int i = 0; i<30; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imgView.image = [UIImage imageNamed:@"flake.png"];

        [self.view addSubview:imgView];
            //tag为5表示可用。
        imgView.tag = 5;
        [_flakeArray addObject:imgView];
    }
    
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
}

- (void)timerMethod{
    
    UIImageView *flake = nil;
    
        //在数组中寻找一个可用的雪花。
    for (int i = 0; i<30; i++) {
        UIImageView *imgView = [_flakeArray objectAtIndex:i];
        if (imgView.tag == 5) {
                //这个雪花可用
            flake = imgView;
                //找到一个可用的雪花后，退出循环
            break;
        }
    }
    
    if (flake) {
            //如果找到了可以重用的雪花，那么就做动画
        
            //tag设置为10表示正在使用
        flake.tag = 10;
        float x = arc4random()%320;
        flake.frame = CGRectMake(x, 0, 20, 20);
            //把雪花当做动画的一个参数，那么在动画结束方法中就可以找到这个雪花。
        [UIView beginAnimations:nil context:(__bridge void *)(flake)];
        [UIView setAnimationDuration:2];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
        flake.frame = CGRectMake(x, 568, 20, 20);
        [UIView commitAnimations];
    }
    
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    UIImageView *flake = (__bridge UIImageView *)context;
        //动画结束之后，雪花就可以使用了，把tag还原为5
    flake.tag = 5;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  ThreadAnimation
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
    
    _angleSpeed = 3/180.0*M_PI;
    
        //[self threadMethod];
    
        //NSThread线程类。
        //detachNewThreadSelector开启一个分线程去执行一个方法。
        //当分线程中的代码执行完毕时，分线程就会结束。
    [NSThread detachNewThreadSelector:@selector(threadMethod) toTarget:self withObject:nil];
    
    
    
}

- (void)threadMethod{
        //isMainThread判断当前线程是否为主线程。
//    if ([NSThread isMainThread]) {
//        NSLog(@"主线程");
//    }else{
//        NSLog(@"分线程");
//    }
    
    
        //利用while(YES)死循环使分线程永远不结束。
    while (YES) {
            //sleepForTimeInterval让当前线程休眠1秒.
        [NSThread sleepForTimeInterval:0.01];
        
        if (_isAnimating) {
            _currentAngle += _angleSpeed;
//            if (_currentAngle>=2*M_PI) {
//                _currentAngle = 0;
//            }
                //*分线程中不能执行修改UI的代码。
                //performSelectorOnMainThread在主线程中去调用一个方法
            
            [self performSelectorOnMainThread:@selector(animationMethod) withObject:nil waitUntilDone:NO];
        }
    }
}

- (void)animationMethod{
    float x = _sunView.center.x + cos(_currentAngle)*120;
    float y = _sunView.center.y - sin(_currentAngle)*80;
    _earthView.center = CGPointMake(x, y);
}




- (IBAction)buttonClick:(UIButton *)sender {
    _isAnimating = !_isAnimating;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

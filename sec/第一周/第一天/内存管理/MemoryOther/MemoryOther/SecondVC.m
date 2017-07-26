//
//  SecondVC.m
//  MemoryOther
//
//  Created by sunhuayu on 15/8/10.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@end


@implementation SecondVC

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //停止timer不能写在dealloc中，一般需要写在viewWillDisappear中。
    [_timer invalidate];
    _timer = nil;
}


- (void)dealloc{
    NSLog(@"secondVC释放了");
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSTimer 只要不停止，就不会释放，一旦停止，如果引用计数为0，就会释放。
    //NSTimer会对自己的target引用计数+1.
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
}

- (void)timerMethod{
    NSLog(@"123");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

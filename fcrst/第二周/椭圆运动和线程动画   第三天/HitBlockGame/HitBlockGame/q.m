//
//  ViewController.m
//  HitBlockGame
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
    
    _xSpeed = 2;
    _ySpeed = 2;
    
    _ballView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 130, 15, 15)];
    _ballView.image = [UIImage imageNamed:@"fireball.png"];
    [self.view addSubview:_ballView];
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerHandle) userInfo:nil repeats:YES];
    
        //创建15个砖块
    for (int i = 0; i<15; i++) {
        UIView *block = [[UIView alloc] initWithFrame:CGRectMake(10+i%5*62, 30+i/5*30, 52, 20)];
        block.backgroundColor = [UIColor greenColor];
        [self.view addSubview:block];
        _blocks[i] = block;
    }
}

    //重置砖块
- (void)resetBlock{
    for (int i = 0; i<15; i++){
        UIView *block = _blocks[i];
        [self.view addSubview:block];
    }
}

- (void)timerHandle{
        //边界判断
    if (_ballView.center.x>=305) {
        int a = -(arc4random()%3+3);
        _xSpeed = a;
    }
    if (_ballView.center.y>=553) {
            //_ySpeed = -2;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"GameOver" message:nil delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:@"再来一次", nil];
        [alert show];
        [_timer invalidate];
    }
    if (_ballView.center.x<=15) {
        int a = arc4random()%3+3;
        _xSpeed = a;
    }
    if (_ballView.center.y<=15) {
        int a = arc4random()%3+3;
        _ySpeed = a;
    }
    
        //地板碰撞判断
    if (CGRectIntersectsRect(_ballView.frame, _bottomView.frame)) {
        int a = -(arc4random()%3+3);
        _ySpeed = a;
    }
    
    BOOL isfinish = YES;
        //砖块碰撞判断
    for (int i = 0; i<15; i++) {
        UIView *block = _blocks[i];
            //如果没有父视图，说明已经碰撞过了
        if (!block.superview) {
            continue;
        }
        
        isfinish = NO;
        
            //判断两个CGRect是否有交叉(是否碰撞)
        if (CGRectIntersectsRect(block.frame, _ballView.frame)) {
            
            int a = arc4random()%3+3;
            _ySpeed = a;
            //碰撞之后从父视图移除
            [block removeFromSuperview];
        }
    }
    
    if (isfinish) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"恭喜您过关了" message:nil delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:@"再来一次", nil];
        [alert show];
        [_timer invalidate];
    }
    
    _ballView.center = CGPointMake(_ballView.center.x+_xSpeed, _ballView.center.y+_ySpeed);
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [self resetGame];
    }
}

    //重置游戏
- (void)resetGame{
    _ballView.center = CGPointMake(40, 150);
    _xSpeed = 2;
    _ySpeed = 2;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerHandle) userInfo:nil repeats:YES];
    [self resetBlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

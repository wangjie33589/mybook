//
//  RainView.m
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/7.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "RainView.h"

@implementation RainView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        _waterArray = [[NSMutableArray alloc] initWithCapacity:0];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
    return self;
}


- (void)timerMethod{
    UIImageView *water = nil;
    
    if (_waterArray.count>0) {
        water = [_waterArray firstObject];
        [_waterArray removeObject:water];
    }else{
        water = [[UIImageView alloc] initWithFrame:CGRectMake(-100, -100, 5, 15)];
        water.image = [UIImage imageNamed:@"w_rain.png"];
        [self addSubview:water];
    }
    
    int x = arc4random()%279;
    
    water.center = CGPointMake(x, -2);
    [UIView beginAnimations:nil context:(__bridge void *)(water)];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    water.center = CGPointMake(x, 292);
    [UIView commitAnimations];
    
}


- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    UIImageView *water = (__bridge UIImageView *)(context);
    
    [_waterArray addObject:water];
}

@end














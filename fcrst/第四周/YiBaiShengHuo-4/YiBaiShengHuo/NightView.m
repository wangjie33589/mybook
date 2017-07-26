//
//  NightView.m
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/7.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "NightView.h"

@implementation NightView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        //背景图片
        UIImageView *background = [[UIImageView alloc] initWithFrame:self.bounds];
        background.image = [UIImage imageNamed:@"w_night.png"];
        [self addSubview:background];
        
        //星星
        for (int i = 0; i<20; i++) {
            int size = arc4random()%10+10;
            UIImageView *star = [[UIImageView alloc] initWithFrame:CGRectMake(arc4random()%261, arc4random()%271, size, size)];
            star.animationImages = @[[UIImage imageNamed:@"xx1.png"],[UIImage imageNamed:@"xx2.png"]];
            star.animationDuration = 0.5;
            [star startAnimating];
            [self addSubview:star];
        }
        
        //月亮
        UIImageView *moon = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 100, 100)];
        moon.animationImages = @[[UIImage imageNamed:@"w_moon1.png"],[UIImage imageNamed:@"w_moon2.png"]];
        moon.animationDuration = 0.5;
        [self addSubview:moon];
        [moon startAnimating];
        
    }
    return self;
}



@end













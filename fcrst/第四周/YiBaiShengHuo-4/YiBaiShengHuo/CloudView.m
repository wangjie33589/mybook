//
//  CloudView.m
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/7.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "CloudView.h"

@implementation CloudView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _cloudArray = [[NSMutableArray alloc] initWithCapacity:5];
        
        for (int i = 0; i<5; i++) {
            UIImageView *cloud = [[UIImageView alloc] initWithFrame:CGRectMake(-500, -500, 100, 40)];
            cloud.image = [UIImage imageNamed:@"w_cloud"];
            cloud.tag = 10;
            [_cloudArray addObject:cloud];
            [self addSubview:cloud];
        }
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
        
    }
    return self;
}

- (void)timerMethod{
    for (int i = 0; i<5; i++) {
        UIImageView *cloud = [_cloudArray objectAtIndex:i];
        if (cloud.tag == 10) {
            cloud.tag = 11;
            int y = arc4random()%201;
            cloud.center = CGPointMake(self.frame.size.width+cloud.frame.size.width/2, y);
            [UIView beginAnimations:nil context:(__bridge void *)cloud];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
            [UIView setAnimationDuration:arc4random()%2+2];
            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
            cloud.center = CGPointMake(0-cloud.frame.size.width/2, y);
            [UIView commitAnimations];
            break;
        }
    }
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    UIImageView *cloud = (__bridge UIImageView *)context;
    cloud.tag = 10;
}



@end















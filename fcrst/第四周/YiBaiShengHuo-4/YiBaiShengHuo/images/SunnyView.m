//
//  SunnyView.m
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/7.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "SunnyView.h"

@implementation SunnyView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        backgroundView.image = [UIImage imageNamed:@"w_qing.png"];
        [self addSubview:backgroundView];
        
        UIImageView *sunView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 80, 80)];
        sunView.animationImages = @[[UIImage imageNamed:@"w_sun1.png"],[UIImage imageNamed:@"w_sun2.png"]];
        sunView.animationDuration = 0.5;
        [sunView startAnimating];
        [self addSubview:sunView];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

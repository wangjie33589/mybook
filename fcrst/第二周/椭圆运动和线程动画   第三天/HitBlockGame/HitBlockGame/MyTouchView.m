//
//  MyTouchView.m
//  HitBlockGame
//
//  Created by 孙 化育 on 15-7-22.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "MyTouchView.h"

@implementation MyTouchView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
        //记录下点击时的坐标
    _beginCenter = self.center;
    _beginX = [[touches anyObject] locationInView:self.superview].x;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.superview];
    //根据现在的坐标和点击时的坐标算出偏移量。
    float x = _beginCenter.x+(point.x-_beginX);
    
        //不能让地板超出屏幕范围
    if (x<self.frame.size.width/2) {
        x = self.frame.size.width/2;
    }
    if (x>320-self.frame.size.width/2) {
        x = 320-self.frame.size.width/2;
    }
    self.center = CGPointMake(x, _beginCenter.y);
    
}





@end

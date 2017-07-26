//
//  MyTouchView.h
//  HitBlockGame
//
//  Created by 孙 化育 on 15-7-22.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>

    //自定义一个view，用于处理touch事件。

@interface MyTouchView : UIView{
    CGPoint     _beginCenter;
    float       _beginX;
}

@end

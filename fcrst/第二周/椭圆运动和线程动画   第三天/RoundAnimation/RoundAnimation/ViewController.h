//
//  ViewController.h
//  RoundAnimation
//
//  Created by 孙 化育 on 15-7-22.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
        //当前角度值
    float           _currentAngle;
    
        //角速度
    float           _angleSpeed;
    
    
    float           _moonSpeed;
    float           _moonAngle;
    
    __weak IBOutlet UIImageView *_sunView;
    __weak IBOutlet UIImageView *_earthView;
    
    __weak IBOutlet UIImageView *_moonView;
    
    
    NSTimer         *_timer;
    
        //是否正在做动画
    BOOL            _isAnimation;
    
}


@end









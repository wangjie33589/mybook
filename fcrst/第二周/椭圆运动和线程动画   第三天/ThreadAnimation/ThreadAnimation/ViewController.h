//
//  ViewController.h
//  ThreadAnimation
//
//  Created by 孙 化育 on 15-7-22.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    __weak IBOutlet UIImageView *_sunView;
    __weak IBOutlet UIImageView *_earthView;
    
    float           _angleSpeed;
    
    float           _currentAngle;
    
        //是否正在做动画
    BOOL            _isAnimating;
}


@end








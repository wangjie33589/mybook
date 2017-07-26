//
//  MainVC.h
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/3.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController{
    NSMutableArray      *_buttonArray;
    
    int                 _currentAngle;
    
    int                 _targetAngle;
    
    int                 _speed;
    
    NSTimer             *_timer;
}

@end

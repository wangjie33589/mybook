//
//  ViewController.h
//  HitBlockGame
//
//  Created by 孙 化育 on 15-7-22.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTouchView.h"

@interface ViewController : UIViewController{
    
    float           _xSpeed;
    float           _ySpeed;
    
    NSTimer         *_timer;
    
    UIImageView     *_ballView;
    
        //底板
    __weak IBOutlet MyTouchView *_bottomView;
    
        //定义一个数组，存放15个view砖块。
    UIView          *_blocks[15];
    
}


@end













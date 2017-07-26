//
//  ViewController.h
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/3.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSMutableArray          *_imageViewArray;
    
    //定义一个BOOL值数组，用于记录4个imageView的状态(上面有没有button)
    BOOL                    _hasButton[4];
    
    //正确的数字个数
    int                     _correctNumber;
}


@end












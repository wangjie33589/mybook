//
//  CityVC.h
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/5.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityVC : UIViewController<UIScrollViewDelegate>{
    UIScrollView        *_verticalScrollView;
    
    UIScrollView        *_horizontalScroll;
    
    UIPageControl       *_pageControl;
    
    NSTimer             *_timer;
    
    int                 _page;
    
    NSMutableArray      *_buttonArray;
    
    BOOL                _isOpen;
    
}

@end








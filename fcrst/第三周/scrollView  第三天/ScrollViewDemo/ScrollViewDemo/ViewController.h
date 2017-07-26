//
//  ViewController.h
//  ScrollViewDemo
//
//  Created by sunhuayu on 15/7/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>{
    
    //UIScrollView 滚动视图
    UIScrollView        *_scrollView;
    
    
    //页码控制器
    UIPageControl       *_pageControl;
    
    
    int                 _currentPage;
    
}


@end














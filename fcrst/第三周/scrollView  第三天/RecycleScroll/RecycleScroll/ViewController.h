//
//  ViewController.h
//  RecycleScroll
//
//  Created by sunhuayu on 15/7/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>{
    
    __weak IBOutlet UIScrollView *_scrollView;
    
    __weak IBOutlet UIPageControl *_pageControl;
    
}


@end


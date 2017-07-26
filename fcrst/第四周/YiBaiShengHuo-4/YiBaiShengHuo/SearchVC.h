//
//  SearchVC.h
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/6.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchVC : UIViewController{
    
    __weak IBOutlet UIScrollView *_scrollView;
    __weak IBOutlet UIWebView *_webView;
    
    NSArray         *_buttonTitleArray;
    
    UIView          *_redView;
    
    NSMutableArray  *_buttonArray;
    
    int             _currentSelectedButton;
    
    NSArray         *_urlArray;
}

@end











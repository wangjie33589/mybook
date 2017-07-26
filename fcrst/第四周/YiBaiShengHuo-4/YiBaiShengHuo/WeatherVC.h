//
//  WeatherVC.h
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/7.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SunnyView.h"
#import "NightView.h"
#import "CloudView.h"
#import "RainView.h"

@interface WeatherVC : UIViewController{
    
    __weak IBOutlet UIScrollView *_scrollView;
    
    __weak IBOutlet UIImageView *_weatherImageView;
    
    BOOL                _isNight;
    
    int                 _selectedButtonIndex;
    
    NSMutableArray      *_buttonArray;
    
    UIImageView         *_tipView;
    
    SunnyView           *_sun;
    
    NightView           *_night;
    
    CloudView           *_cloud;
    
    RainView           *_rain;
}

@end













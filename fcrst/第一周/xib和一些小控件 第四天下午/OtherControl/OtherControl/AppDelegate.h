//
//  AppDelegate.h
//  OtherControl
//
//  Created by 孙 化育 on 15-7-17.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    __weak IBOutlet UISegmentedControl *_segControl;
    
    __weak IBOutlet UISlider *_redSlider;
    
    __weak IBOutlet UISlider *_greenSlider;
    
    __weak IBOutlet UISlider *_blueSlider;
    
    __weak IBOutlet UISwitch *_switch;
    
    __weak IBOutlet UIActivityIndicatorView *_indicatorView;
    
    __weak IBOutlet UIProgressView *_progressView;
    
}




@property (strong, nonatomic)IBOutlet UIWindow *window;


@end










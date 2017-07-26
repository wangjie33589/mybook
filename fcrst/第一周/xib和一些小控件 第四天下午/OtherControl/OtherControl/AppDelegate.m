//
//  AppDelegate.m
//  OtherControl
//
//  Created by 孙 化育 on 15-7-17.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [_indicatorView startAnimating];
    
        //停止转动时自动隐藏
    _indicatorView.hidesWhenStopped = YES;
    
        //设置初始选中值
    _segControl.selectedSegmentIndex =  2;
        //主动调用valueChange方法
    [self segmentControlValueChange:_segControl];
    
        //[self colorSliderChange:nil];
    
    
    return YES;
}

- (IBAction)segmentControlValueChange:(UISegmentedControl *)sender {
        //对布尔值取反，动画改编开关的状态。
        //[_switch setOn:!_switch.on animated:YES];
    _window.backgroundColor = sender.selectedSegmentIndex == 0?[UIColor redColor]:sender.selectedSegmentIndex == 1?[UIColor greenColor]:[UIColor blueColor];
    
//    switch (sender.selectedSegmentIndex) {
//        case 0:
//            _window.backgroundColor = [UIColor redColor];
//            break;
//        case 1:
//            _window.backgroundColor = [UIColor greenColor];
//            break;
//        case 2:
//            _window.backgroundColor = [UIColor blueColor];
//            break;
//        default:
//            break;
//    }
}

    //slider的valuechange方法调用频率很高。
- (IBAction)sliderValueChange:(UISlider *)sender {
    NSLog(@"%f",sender.value);
        //alpha是UIView的属性，表示透明度，0表示完全透明，1表示不透明。当一个控件透明度是0时，那么它就不可交互。
    _segControl.alpha = sender.value;
    
        //progress表示进度，范围0-1；
    _progressView.progress = sender.value;
}

- (IBAction)colorSliderChange:(UISlider *)sender {
        //colorWithRed自己通过RGB值调配一个颜色。
    UIColor *color= [UIColor colorWithRed:_redSlider.value green:_greenSlider.value blue:_blueSlider.value alpha:1];
    _window.backgroundColor = color;
}

- (IBAction)switchValueChange:(UISwitch *)sender {
    if (sender.on) {
        _redSlider.enabled = YES;
        _greenSlider.enabled = YES;
        _blueSlider.enabled = YES;
        [_indicatorView startAnimating];
    }else{
        _redSlider.enabled = NO;
        _greenSlider.enabled = NO;
        _blueSlider.enabled = NO;
        [_indicatorView stopAnimating];
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

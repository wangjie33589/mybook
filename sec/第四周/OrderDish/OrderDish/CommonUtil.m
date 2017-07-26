//
//  CommonUtil.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/27.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "CommonUtil.h"

@implementation CommonUtil

+ (void)changeWindowRootViewcontroller:(UIViewController *)vc{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    [vc view];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:window cache:YES];
    window.rootViewController = vc;
    
    
    [UIView commitAnimations];
}

+ (void)flipView:(UIView *)view{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:view cache:YES];
    [UIView commitAnimations];
}

@end

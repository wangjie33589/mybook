//
//  AppDelegate.m
//  ViewAnimation
//
//  Created by 孙 化育 on 15-7-20.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    _view = [[UIView alloc] initWithFrame:CGRectMake(20, 40, 170, 30)];
    _view.backgroundColor = [UIColor greenColor];
    [_window addSubview:_view];
    
    
    
    return YES;
}


- (IBAction)beginAnimation:(UIButton *)sender {
    _view.frame = CGRectMake(20, 40, 170, 30);
    _view.backgroundColor = [UIColor greenColor];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
        //[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:_view cache:YES];
    _view.backgroundColor = [UIColor redColor];
    _view.frame = CGRectMake(50, 70, 200, 50);
    
    [UIView commitAnimations];
    
    
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

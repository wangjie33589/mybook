//
//  AppDelegate.m
//  PeopleProperty
//
//  Created by 孙 化育 on 15-7-15.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "AppDelegate.h"
    //#import "ZYPeople.h"
#import "Man.h"
#import "Woman.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ZYPeople *p = [[ZYPeople alloc] init];
    
        //如果对一个属性进行property描述，那么就可以通过打点进行set和get方法。
    
        //调用了set方法。
    p.name = @"123";
    
        //调用了get方法。
    
    
    
    
    NSString *name = p.name;
  
    
    

    Man *man = [[Man alloc] init];
    man.name = @"张三";
    man.age = 20;
    man.height = 175;
    man.cigarette = @"十一曲";
    
        //[man produceSelf];
    
    Woman *woman = [[Woman alloc] init];
    
    BOOL agree = [woman findBoyFriend:man];
        //if (agree)就相当于if (agree == YES)
        //if (!agree)相当于(agree == NO)
    if (agree) {
        NSLog(@"可以谈");
        ZYPeople *baby = [woman makeBaby];
        NSLog(@"baby====%@",baby);
    }else{
        NSLog(@"免谈");
    }
    
    return YES;
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

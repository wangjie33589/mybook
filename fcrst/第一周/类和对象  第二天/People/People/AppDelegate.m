//
//  AppDelegate.m
//  People
//
//  Created by 孙 化育 on 15-7-15.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "AppDelegate.h"

    //import""用来导入自己写的文件，import<>用来导入自行自带的文件。

    //在文件中需要使用其他的类时，需要先导入这个类的头文件
#import "People.h"


    //AppDelegate 叫做应用程序代理类，俗称入口类，程序启动之后，先进入入口类。
@interface AppDelegate ()

@end

@implementation AppDelegate

    
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
        //NSLog 是OC中的输出语句。
    NSLog(@"hello word");
        //People *表示People类型的指针，指针用来指向一块内存地址。
        //p表示指针的名字
        //People alloc 在内存中开辟出一块空间，然后创建一个People对象，放在这块内存中。
        //声明一个People指针，指向一个新创建的People对象。
    People *p = [[People alloc]init];
    
        //方括号表示调用方法。调用一个方法，就相当于执行这个方法中的代码
    [p sleep];

    [p setName:@"张三"];
    
    [p setAge:30];
    
    [p setSex:YES];
    
    [p produceSelf];
    
    NSString *name = [p name];
    NSLog(@"%@",name);
    
        //初始化方法可以在创建一个对象的同时给他的各个属性赋初始值。
    People *p2 = [[People alloc] initWithName:@"大圣" age:34 height:180 sex:YES];
    [p2 produceSelf];
    
    
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

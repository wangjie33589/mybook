//
//  AppDelegate.m
//  ColorButton
//
//  Created by 孙 化育 on 15-7-16.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    
        //用for循环创建3个button
    for (int i = 0; i<3; i++) {

        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.backgroundColor = [UIColor greenColor];
        
            //给button设置不同的tag,当button点击时就能根据tag判断到底是哪个button点击了
        button.tag = i;
        
            //根据i计算按钮的x坐标
        button.frame = CGRectMake(40+i*60, 40, 50, 40);
//        NSString *color;
//        switch (i) {
//            case 0:
//                color = @"红";
//                break;
//            case 1:
//                color = @"绿";
//                break;
//            case 2:
//                color = @"蓝";
//                break;
//            default:
//                break;
//        }
        [button setTitle:i == 0?@"红":(i == 1?@"绿":@"蓝") forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_window addSubview:button];
    }
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 120, 200, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [_window addSubview:textField];
    
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    [_button setTitle:@"确定" forState:UIControlStateNormal];
    _button.frame = CGRectMake(40, 160, 200, 30);
    _button.backgroundColor = [UIColor yellowColor];
    
    [_window addSubview:_button];
    
        //addTarget是UIControl的方法，所有继承于UIControl的控件都可以addTarget
        //EditingChanged表示内容发生编辑的事件。
    [textField addTarget:self action:@selector(textFieldEdit:) forControlEvents:UIControlEventEditingChanged];
    
    _button.enabled = NO;
    
    
    return YES;
}

- (void)textFieldEdit:(UITextField *)sender{
    NSLog(@"内容发生变化了");
    
        //length属性表示字符串的长度
    if (sender.text.length>0) {
            //有内容
        _button.enabled = YES;
    }else{
            //没有内容
        _button.enabled = NO;
    }
}

- (void)buttonClick:(UIButton *)sender{
        //通过sender的tag判断是哪个button点击
    if (sender.tag == 0) {
        _window.backgroundColor = [UIColor redColor];
        return;
    }
    if (sender.tag == 1){
        _window.backgroundColor = [UIColor greenColor];
        return;
    }
    if (sender.tag == 2){
        _window.backgroundColor = [UIColor blueColor];
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

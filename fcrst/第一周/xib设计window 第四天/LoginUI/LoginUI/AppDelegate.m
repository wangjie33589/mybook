//
//  AppDelegate.m
//  LoginUI
//
//  Created by 孙 化育 on 15-7-17.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _window.backgroundColor = [UIColor orangeColor];
    
    [_window makeKeyAndVisible];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 80, 30)];
    nameLabel.text = @"用户名";
    [_window addSubview:nameLabel];
    
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, 80, 30)];
    passwordLabel.text = @"密码";
    [_window addSubview:passwordLabel];
    
    UITextField *nameField = [[UITextField alloc] initWithFrame:CGRectMake(110, 80, 180, 30)];
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    [nameField addTarget:self action:@selector(textFieldEdit:) forControlEvents:UIControlEventEditingChanged];
    nameField.tag = 1;
    [_window addSubview:nameField];
    
    UITextField *passwordField = [[UITextField alloc] initWithFrame:CGRectMake(110, 120, 180, 30)];
    
        //密文输入。
    passwordField.secureTextEntry = YES;
    
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    [passwordField addTarget:self action:@selector(textFieldEdit:) forControlEvents:UIControlEventEditingChanged];
    passwordField.tag = 2;
    [_window addSubview:passwordField];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    _loginButton.backgroundColor = [UIColor yellowColor];
    _loginButton.frame = CGRectMake(30, 170, 260, 30);
    _loginButton.enabled = NO;
    [_window addSubview:_loginButton];
    
    _registButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_registButton setTitle:@"注册" forState:UIControlStateNormal];
    _registButton.backgroundColor = [UIColor greenColor];
    _registButton.frame = CGRectMake(30, 210, 260, 30);
    [_window addSubview:_registButton];
    
    return YES;
}


- (void)textFieldEdit:(UITextField *)sender{
        //当需要通过viewWithTag寻找某控件时，那么这个控件的tag不能设置为0.
    UITextField *nameField = (UITextField *)[_window viewWithTag:1];
    
    UITextField *passwordField = (UITextField *)[_window viewWithTag:2];
    
    if (nameField.text.length>0&&passwordField.text.length>0) {
        _loginButton.enabled = YES;
    }else{
        _loginButton.enabled = NO;
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

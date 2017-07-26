//
//  AppDelegate.m
//  LoginAndRegist
//
//  Created by 孙 化育 on 15-7-20.
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
    
        //创建登录视图
    _loginView = [[UIView alloc] initWithFrame:_window.bounds];
    [_window addSubview:_loginView];
    
        //UIImageView，图片视图，可以用来显示一张图片。
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:_window.bounds];
        //设置imageView显示的图片。
        //UIImage 图片类，表示一张图片。
    backgroundView.image = [UIImage imageNamed:@"loginbg.jpg"];
    [_loginView addSubview:backgroundView];
    
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 60, 60, 30)];
    nameLabel.text = @"用户名";
    [_loginView addSubview:nameLabel];
    
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, 60, 30)];
    passwordLabel.text = @"密码";
    [_loginView addSubview:passwordLabel];
    
        //输入框
    UITextField *nameField = [[UITextField alloc] initWithFrame:CGRectMake(100, 60, 180, 30)];
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    [_loginView addSubview:nameField];
    
    UITextField *passwordField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 180, 30)];
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    passwordField.secureTextEntry = YES;
    [_loginView addSubview:passwordField];
    
        //按钮
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(40, 150, 240, 30);
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
        //给button设置背景图片
    [loginButton setBackgroundImage:[UIImage imageNamed:@"login.png"] forState:UIControlStateNormal];
    [_loginView addSubview:loginButton];
    
    UIButton *registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registButton.frame = CGRectMake(40, 190, 240, 30);
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    [registButton setBackgroundImage:[UIImage imageNamed:@"register.png"] forState:UIControlStateNormal];
    [registButton addTarget:self action:@selector(registButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_loginView addSubview:registButton];
    
    
        //创建注册view
    _registView = [[UIView alloc] initWithFrame:_window.bounds];
    _registView.backgroundColor = [UIColor greenColor];
    
    for (int i = 0; i<3; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 60+i*(30+10), 70, 30)];
        label.text = i == 0?@"用户名":i == 1?@"密码":@"确认密码";
        [_registView addSubview:label];
        
        UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(110, 60+i*(30+10), 170, 30)];
        field.borderStyle = UITextBorderStyleRoundedRect;
        field.tag = i+1;
        [_registView addSubview:field];
        if (i>0) {
            field.secureTextEntry = YES;
        }
    }
    
        //指针是指向一个对象的，让registButton指向一个新创建的button。
    registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registButton.frame = CGRectMake(40, 190, 240, 30);
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    [registButton setBackgroundImage:[UIImage imageNamed:@"login.png"] forState:UIControlStateNormal];
    [registButton addTarget:self action:@selector(registUser:) forControlEvents:UIControlEventTouchUpInside];
    [_registView addSubview:registButton];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(40, 230, 240, 30);
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"register.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_registView addSubview:backButton];
    
    return YES;
}

    //点击初测界面的注册按钮
- (void)registUser:(UIButton *)sender{
    UITextField *nameField = (UITextField *)[_registView viewWithTag:1];
    UITextField *passwordField = (UITextField *)[_registView viewWithTag:2];
    UITextField *confirmField = (UITextField *)[_registView viewWithTag:3];
    
    if (nameField.text.length<=0) {
            //通过调用方法弹出alert。
        [self showAlert:@"用户名不能为空"];
        return;
    }
    
    if (passwordField.text.length<=0) {
        [self showAlert:@"密码不能为空"];
        return;
    }
    
        //字符串的相等判断不能用==，必须用isEqualToString方法。
    if (![passwordField.text isEqualToString:confirmField.text]) {
        [self showAlert:@"两次密码输入不一致"];
        return;
    }
    
    [self showAlert:@"注册成功"];
    
}

    //写一个方法，用于弹出alert，方法设置一个参数，表示alert的内容
- (void)showAlert:(NSString *)title{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:title delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alert show];
}



    //点击登陆界面的注册按钮调用
- (void)registButtonClick:(UIButton *)sender{
        //开始一个动画
    [UIView beginAnimations:nil context:nil];
    
        //写动画的内容（动画需要改变的状态）
    
        //removeFromSuperview从父视图移除。
        //把登录view从父视图移除。
    [_loginView removeFromSuperview];
    
        //添加注册view
    [_window addSubview:_registView];
    
        //设置动画方式，动画的添加对象，动画是否缓存。
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:_window cache:YES];
        //设置动画的持续时间
    [UIView setAnimationDuration:1];
    
        //提交动画（开始动画）
    [UIView commitAnimations];
    
}

    //返回按钮的方法
- (void)backButtonClick:(UIButton *)sender{
    [UIView beginAnimations:nil context:nil];
    [_registView removeFromSuperview];
    [_window addSubview:_loginView];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:_window cache:YES];
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

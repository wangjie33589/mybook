//
//  AppDelegate.m
//  XIBLoginRegist
//
//  Created by 孙 化育 on 15-7-20.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

    //入口方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [_window addSubview:_loginView];
    
    
    return YES;
}

    //登录界面的注册button的方法
- (IBAction)_registButtonClick:(UIButton *)sender {
    
    [UIView beginAnimations:nil context:nil];
    [_loginView removeFromSuperview];
    [_window addSubview:_registView];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:_window cache:YES];
    [UIView commitAnimations];
}

    //注册界面的返回button的方法。
- (IBAction)backButtonClick:(UIButton *)sender {
    [UIView beginAnimations:nil context:nil];
    [_registView removeFromSuperview];
    [_window addSubview:_loginView];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:_window cache:YES];
    [UIView commitAnimations];
}

    //注册界面的注册button的方法
- (IBAction)registUserClick:(UIButton *)sender {
    if (_registNameField.text.length<=0) {
        [self showAlert:@"用户名不能为空"];
        return;
    }
    
    if (_registPasswordField.text.length<=0) {
        [self showAlert:@"密码不能为空"];
        return;
    }
    
    if (![_registPasswordField.text isEqualToString:_confirmField.text]) {
        [self showAlert:@"两次密码输入不一致"];
        return;
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alert show];
    _name = _registNameField.text;
    _password = _registPasswordField.text;
    
        //[self backButtonClick:nil];
}

    //alertView的回调方法。
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self backButtonClick:nil];
}


    //弹出alertView的方法。
- (void)showAlert:(NSString *)title{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:title delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alert show];
}

    //登录button的方法
- (IBAction)loginButtonClick:(UIButton *)sender {
    if ([_loginNameField.text isEqualToString:_name]&&[_loginPasswordField.text isEqualToString:_password]) {
        [self showAlert:@"登录成功"];
    }else{
        [self showAlert:@"登录失败"];
    }
}


@end







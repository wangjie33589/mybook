//
//  RegistVC.m
//  ViewControllerDemo
//
//  Created by 孙 化育 on 15-7-21.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "RegistVC.h"
#import "MyViewController.h"

@interface RegistVC ()

@end

@implementation RegistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)backButtonClick:(UIButton *)sender {
//    MyViewController *vc = [[MyViewController alloc] init];
//    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
//    
//    window.rootViewController = vc;
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:window cache:YES];
//    [UIView commitAnimations];
    
    
        //模态消失
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)registButtonClick:(UIButton *)sender{
    if (_nameField.text.length<=0) {
        [self showAlert:@"用户名不能为空"];
        return;
    }
    
    if (_passwordField.text.length<=0) {
        [self showAlert:@"密码不能为空"];
        return;
    }
    
    if (![_passwordField.text isEqualToString:_confirmField.text]) {
        [self showAlert:@"两次密码输入不一致"];
        return;
    }
    
    [self showAlert:@"注册成功"];
    [self backButtonClick:nil];
}

- (void)showAlert:(NSString *)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alert show];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



@end

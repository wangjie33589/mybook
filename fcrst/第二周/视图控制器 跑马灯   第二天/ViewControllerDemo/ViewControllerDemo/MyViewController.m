//
//  MyViewController.m
//  ViewControllerDemo
//
//  Created by 孙 化育 on 15-7-21.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "MyViewController.h"
#import "RegistVC.h"

#define PLUS(a,b) a+b


@interface MyViewController ()

@end

@implementation MyViewController

    //视图已经出现时调用
- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"视图已经出现了");
}

    //视图将要出现时调用。
- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"将要出现了");
}

    //已经消失
- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"已经消失");
}
    //将要消失
- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"将要消失");
}


    //当视图控制器的view加载完成时调用，vc的view加载完成时，我们就可以在这个view上添加子控件，所以，vc的初始化代码可以写在viewDidLoad中。
    //当vc刚创建时，并不会执行viewDidLoad，当vc.view需要显示时，才会执行viewDidLoad。
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"123");
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    button.frame = CGRectMake(50, 100, 150, 30);
//    [button setTitle:@"按钮" forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor redColor];
//        //self.view就是视图控制器的view
//    [self.view addSubview:button];
    
    
//    int a = PLUS(2, 5)*2;
//    
//    NSLog(@"%d",a);
    
    
    
}

- (IBAction)loginButtonClick:(UIButton *)sender {
    if (_nameField.text.length<=0) {
        [self showAlert:@"用户名不能为空"];
    }
}


- (void)showAlert:(NSString *)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alert show];
}
    //前往注册界面
- (IBAction)registButtonClick:(UIButton *)sender {
//        //先创建注册vc
//    RegistVC *vc = [[RegistVC alloc] init];
//        //UIApplication应用程序类，是一个单例类(只有一个对象，使用时不需要创建，通过单例方法找到这个对象即可)。sharedApplication单例方法。
//        //delegate方法可以获得入口类对象。
//        //通过入口类的get方法找到window
//    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
//    
//    window.rootViewController = vc;
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:window cache:YES];
//    [UIView commitAnimations];
    
    
    RegistVC *vc = [[RegistVC alloc] init];
    
        //模态弹出.
        //模态弹出一个视图控制器。弹出的新控制器view会覆盖本身的view
    [self presentViewController:vc animated:YES completion:nil];
}








@end

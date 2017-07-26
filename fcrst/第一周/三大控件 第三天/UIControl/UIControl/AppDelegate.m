//
//  AppDelegate.m
//  UIControl
//
//  Created by 孙 化育 on 15-7-16.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
        //创建一个UIWinwdow，大小设置为屏幕大小。
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        //设置window的背景颜色
        //+方法用类调用，减号方法用对象调用。
    self.window.backgroundColor = [UIColor whiteColor];
    
        //使window可见。
    [self.window makeKeyAndVisible];
    
        //UIView 视图，能够看见的一块区域。
        //创建一个UIView，并指定初始坐标和大小
        //CGRect是一个结构体，是基本类型，变量不需要加*
    CGRect rect = CGRectMake(0, 0, 100, 50);
        //frame的坐标指的是视图左上角的坐标。
    UIView *view = [[UIView alloc] initWithFrame:rect];
    
        //view的坐标可以修改。
        //view.frame = CGRectMake(20, 20, 30, 30);
    
        //设置view的中心点坐标
        //view.center = CGPointMake(160, 284);
    
        //设置view的背景颜色
    view.backgroundColor = [UIColor redColor];
    
        //addSubview 添加子视图。创建的视图必须添加到window上才能看见。
    [_window addSubview:view];
    
        //后添加的视图会覆盖先添加的视图。
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(50, 25, 100, 50)];
    view2.backgroundColor = [UIColor greenColor];
    [_window addSubview:view2];
    
        //bringSubviewToFront把某个子视图提到最顶层。
    [_window bringSubviewToFront:view];
        //把某个子视图送到最后一层。
    [_window sendSubviewToBack:view];
    
    
    /*------------------*/
        //UILabel  标签，用于显示一段文本。
    _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    _label.backgroundColor = [UIColor yellowColor];
        //设置label显示的文本内容
    _label.text = @"我是一个label";
    
        //设置label的字体,默认是17号字体
    _label.font = [UIFont systemFontOfSize:17];
    
        //设置label的行数，默认是1行，不限制行数写0；
    _label.numberOfLines = 0;
        //设置文本的颜色
    _label.textColor = [UIColor blueColor];
        //设置label的文本位置（居中，居左），
    _label.textAlignment = NSTextAlignmentCenter;
    
    [_window addSubview:_label];
    
        //-----------------------
        //UITextField输入框，
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 200, 30)];
    
        //tag表示view的编号，设置tag之后就可以调用父视图的viewWithTag方法来找到这个视图。
        //tag值默认为0，所以,tag值尽量不要设置为0.
    textField.tag = 99;
    
        //设置输入框的边框样式
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
        //设置清除按钮
    textField.clearButtonMode = UITextFieldViewModeAlways;
    
        //设置键盘的样式
        //textField.keyboardType = UIKeyboardTypePhonePad;
    
        //设置return键的样式
    textField.returnKeyType = UIReturnKeySend;
    
        //设置输入框占位符。
    textField.placeholder = @"请输入您的电话号码";
    
    [_window addSubview:textField];
    
        //-------------------------
        //UIButton可以alloc创建，但是一般都用buttonWithType创建。
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 260, 100, 40);
        //button.showsTouchWhenHighlighted = YES;
    button.backgroundColor = [UIColor purpleColor];
    
        //设置button的某种状态下的标题，
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button setTitle:@"点击了" forState:UIControlStateHighlighted];
    [button setTitle:@"不可点" forState:UIControlStateDisabled];
        //设置button为不可用的
        button.enabled = NO;
        //设置button的标题颜色
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
        //给button绑定一个方法，当button的事件触发时，就会调用这个方法。第一个参数表示调用谁的方法。第二个参数表示调用哪个方法。第三个参数表示绑定的事件，button一般绑定TouchUpInside事件。
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_window addSubview:button];
    
    return YES;
}

    //button绑定的方法没有返回值，方法名字可以随便起，可以没有参数，也可以有一个UIButton类型的参数，如果有参数，button调用方法时就会把自己本身当做参数传进来。
- (void)buttonClick:(UIButton *)sender{
    NSLog(@"button被点击了");
    
    UITextField *asd = (UITextField *)[_window viewWithTag:99];
    
        //_label.text = asd.text;
    _label.text = sender.currentTitle;
}



    //touch事件方法，当屏幕被触摸时，系统就会调用这个方法。
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
        //找到tag值为100的子视图。
        //找到的子视图指针类型是UIView。在确定这个子视图的类型时，可以强制转换为该类型。
    UITextField *tf = (UITextField *)[_window viewWithTag:99];
    
        //失去第一响应(键盘下落)
    [tf resignFirstResponder];
    
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

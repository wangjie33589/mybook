//
//  ViewController.m
//  Notification
//
//  Created by sunhuayu on 15/8/14.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"

@interface ViewController ()

@end



//通知和代理的区别：

//相同之处，都可以实现传值，都可以实现方法回调。
//不同之处，代理只能一对一，而通知可以一对多。 代理可以实现数据回传（双向传值），从而实现数据源方法，但是通知只能实现单向传值。


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //通知不会自动接收，必须主动去监听。
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    //addObserver添加监听者(让某个对象监听通知)，第一个参数是要添加的对象，第二个参数是收到通知时调用的方法，第三个参数是要监听的通知的名字(如果写nil则监听所有通知)，第四个参数用于限定通知来源(只接收某个对象发的通知，如果不限写nil)
    [center addObserver:self selector:@selector(receiveChangeColorNotification:) name:@"changeColor" object:nil];
}

//NSNotification，通知类，其中包含了3个属性，name表示收到的通知的名字,object表示通知的发送者,userInfo表示这个通知的参数，
- (void)receiveChangeColorNotification:(NSNotification *)noti{
    //NSLog(@"收到通知了");
    
    self.view.backgroundColor = [noti.userInfo objectForKey:@"color"];
}



- (IBAction)gotoSecondVC:(UIButton *)sender {
    SecondVC *vc = [[SecondVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

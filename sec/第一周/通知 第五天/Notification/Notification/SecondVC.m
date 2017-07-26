//
//  SecondVC.m
//  Notification
//
//  Created by sunhuayu on 15/8/14.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)dealloc{
    NSLog(@"释放了");
    
    
    
    
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(receiveChangeColorNotification:) name:@"changeColor" object:nil];
}



- (void)receiveChangeColorNotification:(NSNotification *)noti{
    
    NSLog(@"收到通知了");
    
    if (noti.object != self) {
        self.view.backgroundColor = [noti.userInfo objectForKey:@"color"];
    }
    
}




- (IBAction)gotoNextVC:(UIButton *)sender {
    SecondVC *vc = [[SecondVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}


- (IBAction)colorButtonClick:(UIButton *)sender {
    UIColor *color = nil;
    switch (sender.tag) {
        case 1:
            color = [UIColor redColor];
            break;
        case 2:
            color = [UIColor greenColor];
            break;
        case 3:
            color = [UIColor blueColor];
            break;
        default:
            break;
    }
    
    //通知中心，是单例类，单例方法defaultCenter。
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    
    //发送一个通知。第一个参数是通知的名字，第二个参数是通知的发送者（一般写self），第三个参数是通知的参数,用于通知传参。
    [center postNotificationName:@"changeColor" object:self userInfo:@{@"color":color}];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

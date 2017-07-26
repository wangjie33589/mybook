//
//  SecondVC.m
//  MyAlertView
//
//  Created by sunhuayu on 15/7/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "SecondVC.h"


@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickButtonAtIndex:(int)buttonIndex{
    if (buttonIndex == 0) {
        self.view.backgroundColor = [UIColor redColor];
    }else{
        self.view.backgroundColor = [UIColor blueColor];
    }
}


- (IBAction)showAlertClick:(UIButton *)sender {
    MyAlertView *alert = [[MyAlertView alloc] initWithTitle:@"改变颜色" button1:@"红" button2:@"蓝" delegate:self];
    [alert show];
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

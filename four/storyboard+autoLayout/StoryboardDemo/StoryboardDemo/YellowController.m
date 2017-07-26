//
//  YellowController.m
//  StoryboardDemo
//
//  Created by sunhuayu on 15/10/21.
//  Copyright © 2015年 sunhuayu. All rights reserved.
//

#import "YellowController.h"
#import "PurpleController.h"

@interface YellowController ()

@end

@implementation YellowController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)itemClick:(UIBarButtonItem *)sender {
    if ([_textField.text isEqualToString:@"123"]) {
        [self performSegueWithIdentifier:@"yellowToPurple" sender:nil];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation


//VC将要执行一个跳转时调用。经常用于传值。
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //先判断执行的跳转是否是需要传值的跳转。是的话再进行传值。
    if ([segue.identifier isEqualToString:@"yellowToPurple"]) {
        //跳转的目标VC。先确定跳转的vc类型。
        PurpleController *vc = segue.destinationViewController;
        
        //进行传值
        vc.text = _textField.text;
    }
}



@end









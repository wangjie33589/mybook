//
//  PurpleController.m
//  StoryboardDemo
//
//  Created by sunhuayu on 15/10/21.
//  Copyright © 2015年 sunhuayu. All rights reserved.
//

#import "PurpleController.h"

@interface PurpleController ()

@end

@implementation PurpleController

- (void)viewDidLoad {
    [super viewDidLoad];
    _label.text = _text;
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

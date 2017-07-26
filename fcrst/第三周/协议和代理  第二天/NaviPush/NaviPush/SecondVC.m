//
//  SecondVC.m
//  NaviPush
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

- (void)changeColor:(UIColor *)color{
    self.view.backgroundColor = color;
}


- (IBAction)gotoNextVC:(UIButton *)sender {
    SecondVC *vc = [[SecondVC alloc] init];
    vc.previousVC = self;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)colorButtonClick:(UIButton *)sender {
    UIColor *color = nil;
    switch (sender.tag) {
        case 0:
            color = [UIColor redColor];
            break;
        case 1:
            color = [UIColor greenColor];
            break;
        case 2:
            color = [UIColor blueColor];
            break;
            
        default:
            break;
    }
    
    
    [self.previousVC changeColor:color];
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

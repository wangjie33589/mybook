//
//  ViewController.m
//  MasonryDemo
//
//  Created by sunhuayu on 15/10/21.
//  Copyright © 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    
    label.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:label];
    
    //添加约束
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        //默认对比对象为父视图
        make.top.offset(0);
        make.left.offset(0);
        make.right.offset(0);
        make.height.offset(50);
    }];
    
    
    //修改约束
    [label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
    }];
    
    _label2 = [[UILabel alloc] init];
    
    _label2.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:_label2];
    
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(60);
        make.height.offset(40);
    }];
    
}

- (IBAction)buttonClick:(UIButton *)sender {
    
    //通过改变约束添加动画
    [UIView animateWithDuration:1 animations:^{
        [_label2 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
        }];
        
        //约束改变之后需要调用约束所在的view的layoutIfNeeded方法。
        [self.view layoutIfNeeded];
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

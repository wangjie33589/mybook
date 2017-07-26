//
//  ViewController.m
//  ConstrainsByCode
//
//  Created by sunhuayu on 15/10/21.
//  Copyright © 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"自动布局";
    label.textAlignment = NSTextAlignmentCenter;
    
    //如果要用autoLayout添加约束，view的这个属性必须设置为NO，(如果要用frame设置view的布局，那么这个属性必须为YES)，当storyboard或xib中autoLayout打开时，拖拽的控件这个属性都为NO。
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    //必须先把view添加到父视图上，才能添加约束。
    [self.view addSubview:label];
    
    //创建左边界的约束
    NSLayoutConstraint *leftCon = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
    //添加约束
    [self.view addConstraint:leftCon];
    
    NSLayoutConstraint *upCon = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self.view addConstraint:upCon];
    
    NSLayoutConstraint *rightCon = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    [self.view addConstraint:rightCon];
    
    //高度约束
    NSLayoutConstraint *heightCon = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
    
    [label addConstraint:heightCon];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

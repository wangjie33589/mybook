//
//  ViewController.m
//  PickerViewDemo2
//
//  Created by sunhuayu on 15/7/30.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    
    
    //字面量创建数组。
    NSArray *timeArray = @[@"过年的时候",@"今天早上",@"那一夜",@"小时候",@"那年冬天"];
    
    NSArray *whereArray = @[@"在小树林",@"在教室",@"在父母面前",@"在家里",@"在树上",@"在厕所"];
    
    NSArray *doArray = @[@"刷牙",@"敲代码",@"吃饭",@"约会",@"相亲",@"吃鸡蛋饼",@"玩游戏"];
    
    _bigArray = @[timeArray,whereArray,doArray];
    
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    //大数组中有几个小数组，就需要显示几个区。
    return _bigArray.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    //首先根据区号，从大数组中找到对应这个区的小数组，小数组中对象的个数就是这个区的行数。
    NSArray *arr = [_bigArray objectAtIndex:component];
    
    return arr.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //先根据区号从大数组中找到对应这个区的小数组，再根据行号从这个小数组中找到对应这一行的字符串。
    NSArray *arr = [_bigArray objectAtIndex:component];
    return [arr objectAtIndex:row];
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    //selectedRowInComponent 获得某个区当前被选中的行号。
    NSString *str0 = [[_bigArray objectAtIndex:0] objectAtIndex:[_pickerView selectedRowInComponent:0]];
    
    NSString *str1 = [[_bigArray objectAtIndex:1] objectAtIndex:[_pickerView selectedRowInComponent:1]];
    
    NSString *str2 = [[_bigArray objectAtIndex:2] objectAtIndex:[_pickerView selectedRowInComponent:2]];
    
    _label.text = [NSString stringWithFormat:@"我%@%@%@",str0,str1,str2];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end









//
//  ViewController.m
//  PickerViewKeyboard
//
//  Created by sunhuayu on 15/8/13.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 320, 220)];
    
    _datePicker.datePickerMode = UIDatePickerModeDate;
    
    //设置自定义输入键盘
    _textField.inputView = _datePicker;
    
    [_datePicker addTarget:self action:@selector(datePickerChange:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)datePickerChange:(UIDatePicker *)sender{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    
    _textField.text = [formatter stringFromDate:sender.date];
    
    [formatter release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_datePicker release];
    [_textField release];
    [super dealloc];
}
@end

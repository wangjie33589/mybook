//
//  ViewController.m
//  DatePickerDemo
//
//  Created by sunhuayu on 15/7/31.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    
    
    //NSDate 日期类，可以表示一个时间点。
    
    //得到当前时间
    NSDate *date = [NSDate date];
    
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
}

- (void)timerMethod{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    _timeLabel.text = [formatter stringFromDate:date];
}


- (void)dateChange:(UIDatePicker *)sender{
    NSLog(@"%@",_datePicker.date);
    
    //NSDateFormatter日期格式化起器，能够把一个日期类转成字符串类，也可以把一个字符串类转成日期类。
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //设置转换的日期格式
    //yyyy表示年， yy表示年份缩写
    //MM表示月份，M的话前边的0可以省略，MMM表示月份缩写，MMMM表示月份的全拼。
    //dd表示日期，d前边的0可以省略。
    //a表示上下午
    //hh表示时，HH表示24小时制
    //mm表示分。
    //ss表示秒
    //e表示星期几，星期天是第一天。eee表示单词缩写，eeee单词全拼。
    //z表示时区，Z时区的另一种写法。
    [formatter setDateFormat:@"yyyy年MM月dd日 a HH:mm:ss eeee Z"];
    
    
    NSString *dateString = [formatter stringFromDate:_datePicker.date];
    
    //把字符串转为日期类，字符串的日期格式必须和格式化器的格式一致，才能转换成功。
    //[formatter dateFromString:dateString]
    
    _label.text = dateString;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

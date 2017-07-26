//
//  ViewController.m
//  PickerViewDemo
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
    
    _array = [[NSMutableArray alloc] initWithObjects:@"苹果",@"橘子",@"香蕉", nil];
    
    _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 20, 320, 200)];
    
    
    [self.view addSubview:_picker];
    
    
    //pickerView的数据设置必须通过数据源代理来实现。
    
    //设置pickerView的数据源，那么pickerView就会调用数据源方法来设置自己的数据。
    _picker.dataSource = self;
    
    
    //设置pickerView的代理。
    _picker.delegate = self;
    
    
}

//设置pickerView有多少个区(多少列)
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//设置某一区有多少行。
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    //一般情况下，返回数据源数组中对象的个数。
    return _array.count;
}

//设置某个区某一行的标题。
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    //返回数组中对应这一行行号的对象。
    return [_array objectAtIndex:row];
}

//当选择了某个区的某一行时调用。
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _label.text = [_array objectAtIndex:row];
}

- (IBAction)buttonClick:(UIButton *)sender {
    [_textField resignFirstResponder];
    
    [_array addObject:_textField.text];
    
    //重新加载所有区。
    //pickerView的数据源一旦修改，必须立刻刷新pickerView.
    [_picker reloadAllComponents];
    
    _textField.text = @"";
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end










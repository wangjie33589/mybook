//
//  ViewController.m
//  CityPicker
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
    
    NSArray *henan = @[@"郑州",@"开封",@"洛阳",@"平顶山",@"安阳"];
    
    NSArray *hebei = @[@"石家庄",@"邯郸",@"保定",@"邢台"];
    
    NSArray *shandong = @[@"济南",@"青岛",@"烟台"];
    
    //_provinceDic = [[NSDictionary alloc] initWithObjectsAndKeys:henan,@"河南省",hebei,@"河北省",shandong,@"山东省", nil];
    
    _provinceDic = @{@"河南省":henan,@"河北省":hebei,@"山东省":shandong};
    
    
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        //左边的区
        //字典的count表示字典中键值对的个数。
        return _provinceDic.count;
    }else{
        //右边的区
        //首先根据左侧区被选中的行数来确定哪个省被选中，然后从字典的allValue中查找这个省的小数组，返回小数组的个数。
        
        //当前左侧区被选中的行数
        int selectedRow = [_pickerView selectedRowInComponent:0];
        
        //所有的省（一个数组中包含3个小数组）
        NSArray *allProvince = [_provinceDic allValues];
        
        //从大数组中找到选中这个省的小数组
        NSArray *province = [allProvince objectAtIndex:selectedRow];
        
        return province.count;
        
        
//        NSArray *arr =  [[_provinceDic allValues] objectAtIndex:[_pickerView selectedRowInComponent:0]];
//        return arr.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return [[_provinceDic allKeys] objectAtIndex:row];
    }else{
        //先根据左侧被选中的行号确定哪个省被选中，然后从字典中找到对应这个省的数组。
        NSArray *arr =  [[_provinceDic allValues] objectAtIndex:[_pickerView selectedRowInComponent:0]];
        //从这个省的数组中根据行号找出对应这一行的城市。
        if (arr.count>row) {
            return [arr objectAtIndex:row];
        }else{
            return nil;
        }
        
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //如果选择了左边区的某一行，刷新右边的区。
    if (component == 0) {
        [pickerView reloadComponent:1];
        //[pickerView selectRow:0 inComponent:1 animated:NO];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

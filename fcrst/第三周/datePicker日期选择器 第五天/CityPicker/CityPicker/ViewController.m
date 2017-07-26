//
//  ViewController.m
//  CityPicker
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
    
    _array = @[@{@"provinceName":@"河南省",@"city":@[@{@"cityName":@"郑州",@"county":@[@"新密",@"荥阳"]},@{@"cityName":@"开封",@"county":@[@"兰考",@"尉氏"]}]},@{@"provinceName":@"山东",@"city":@[@{@"cityName":@"济南",@"county":@[@"平阴县",@"济阳县"]},@{@"cityName":@"青岛",@"county":@[@"胶州县",@"崂山"]}]}];
    
    
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    int selectedProvince = [pickerView selectedRowInComponent:0];
    NSArray *cityArray = [[_array objectAtIndex:selectedProvince] objectForKey:@"city"];
    switch (component) {
        case 0:
            return _array.count;
            break;
        case 1:{
            
            return cityArray.count;
        }
            break;
        case 2:{
            int selectedCity = [pickerView selectedRowInComponent:1];
            NSArray *countyArray = [[cityArray objectAtIndex:selectedCity] objectForKey:@"county"];
            return countyArray.count;
        }
            break;
        default:
            break;
    }
    
    return 0;
    
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    int selectedProvince = [pickerView selectedRowInComponent:0];
    NSArray *cityArray = [[_array objectAtIndex:selectedProvince] objectForKey:@"city"];
    if (component == 0) {
        NSDictionary *province = [_array objectAtIndex:row];
        return [province objectForKey:@"provinceName"];
    }else if (component == 1){
        NSDictionary *city = [cityArray objectAtIndex:row];
        return [city objectForKey:@"cityName"];
    }else{
        NSDictionary *city = [cityArray objectAtIndex:[pickerView selectedRowInComponent:1]];
        NSArray *countyArrray = [city objectForKey:@"county"];
        NSString *county = [countyArrray objectAtIndex:row];
        return county;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
    }else if (component == 1){
        [pickerView reloadComponent:2];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end












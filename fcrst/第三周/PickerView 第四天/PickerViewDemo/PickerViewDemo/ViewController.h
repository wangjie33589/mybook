//
//  ViewController.h
//  PickerViewDemo
//
//  Created by sunhuayu on 15/7/30.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>{
    
    //UIPickerView选择器视图
    UIPickerView        *_picker;
    
    //定义一个数组，当做pickerView的数据源。
    NSMutableArray      *_array;
    
    __weak IBOutlet UITextField *_textField;
    
    __weak IBOutlet UILabel *_label;
    
    
}


@end














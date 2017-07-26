//
//  ViewController.h
//  DatePickerDemo
//
//  Created by sunhuayu on 15/7/31.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    //UIDatePicker日期时间选择器，和pickerView没有继承关系，只是外表相似。
    
    __weak IBOutlet UIDatePicker *_datePicker;
    
    
    __weak IBOutlet UILabel *_label;
    
    
    __weak IBOutlet UILabel *_timeLabel;
    
}


@end


//
//  ViewController.h
//  CityPicker
//
//  Created by sunhuayu on 15/7/31.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>{
    
    __weak IBOutlet UIPickerView *_pickerView;
    
    NSArray         *_array;
}


@end











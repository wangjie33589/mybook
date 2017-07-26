//
//  ViewController.h
//  PickerViewDemo2
//
//  Created by sunhuayu on 15/7/30.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>{
    
    __weak IBOutlet UIPickerView *_pickerView;
    
    NSArray         *_bigArray;
    
    __weak IBOutlet UILabel *_label;
    
}


@end











//
//  ViewController.h
//  UseAlertView
//
//  Created by sunhuayu on 15/7/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAlertView.h"

@interface ViewController : UIViewController<MyAlertViewDelegate>{
    
    __weak IBOutlet UILabel *_label;
}


@end









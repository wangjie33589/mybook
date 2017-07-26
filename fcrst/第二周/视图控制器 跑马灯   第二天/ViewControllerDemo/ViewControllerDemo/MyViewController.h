//
//  MyViewController.h
//  ViewControllerDemo
//
//  Created by 孙 化育 on 15-7-21.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>


    //UIViewController叫做视图控制器，用于控制一个UIView的界面布局等功能。
@interface MyViewController : UIViewController{
    
    __weak IBOutlet UITextField *_nameField;
    __weak IBOutlet UITextField *_passwordField;
}



@end












//
//  AppDelegate.h
//  XIBDemo
//
//  Created by 孙 化育 on 15-7-17.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
        //IBOutlet表示此变量指向xib中的某个控件。
        //如果需要在代码中使用xib中的控件，就必须对xib中的这个控件进行连线。
    
    __weak IBOutlet UITextField *_nameField;
    
    __weak IBOutlet UITextField *_password;
    
}

@property (strong, nonatomic) IBOutlet UIWindow *window;


@end











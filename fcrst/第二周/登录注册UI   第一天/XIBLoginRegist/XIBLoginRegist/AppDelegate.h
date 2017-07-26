//
//  AppDelegate.h
//  XIBLoginRegist
//
//  Created by 孙 化育 on 15-7-20.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UIAlertViewDelegate>{
    
    __weak IBOutlet UIView *_loginView;
    __weak IBOutlet UIView *_registView;
    
    __weak IBOutlet UITextField *_registNameField;
    
    __weak IBOutlet UITextField *_registPasswordField;
    
    __weak IBOutlet UITextField *_confirmField;
    
    
    NSString        *_name;
    NSString        *_password;
    
    
    __weak IBOutlet UITextField *_loginNameField;
    
    __weak IBOutlet UITextField *_loginPasswordField;
}

@property (strong, nonatomic)IBOutlet UIWindow *window;


@end


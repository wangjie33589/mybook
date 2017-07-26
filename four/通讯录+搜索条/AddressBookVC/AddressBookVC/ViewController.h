//
//  ViewController.h
//  AddressBookVC
//
//  Created by 孙 化育 on 15-6-17.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>

    //AddressBook框架提供通讯录使用功能。
    //#import <AddressBook/AddressBook.h>

    //AddressBookUI框架提供了通讯录的界面功能
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController<ABPeoplePickerNavigationControllerDelegate>{
    
    IBOutlet UILabel *_nameLabel;
    IBOutlet UILabel *_phoneLabel;
}


@end











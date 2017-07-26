//
//  ViewController.m
//  AddressBookVC
//
//  Created by 孙 化育 on 15-6-17.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "ViewController.h"






@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)showAddressBookClick:(UIButton *)sender {
        //ABPeoplePickerNavigationController联系人选择器，可以显示用户的通讯录（必须有权限）。
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
        //设置联系人选择代理
    picker.peoplePickerDelegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
    
    [picker release];
}

    //当点击cancel按钮时调用。
//- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}


    //选择某个联系人时调用,如果实现这个方法，点击联系人时通讯录就会消失。
//- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person {
//    
//}

    //选择了某个联系人的某个属性时调用。如果实现这个方法，点击属性时通讯录就会消失。
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
        //person参数中存储了联系人的所有信息
        //property参数表示用户所点击了哪个属性（电话、地址、生日）
        //identifier表示用户点击了这类属性的第几个。
    
        //获取联系人的姓名
    NSString *name = (NSString *)ABRecordCopyCompositeName(person);
    _nameLabel.text = name;
    
    CFRelease(name);
    
    if (property == kABPersonPhoneProperty) {
            //获取用户的所有电话
        ABMutableMultiValueRef ref = ABRecordCopyValue(person, property);
        
            //获取点击的电话的索引值
        int index = ABMultiValueGetIndexForIdentifier(ref, identifier);
        
            //根据索引值取出所点击的电话
        NSString *phone = ABMultiValueCopyValueAtIndex(ref, index);
        
        _phoneLabel.text = [self trimString:phone];
    }
    
}

    //删除字符串中非数字的字符
- (NSString *)trimString:(NSString *)string{
        //把字符串转换为可变字符串
    NSMutableString *mString = [NSMutableString stringWithString:string];
    
    NSCharacterSet *numberSet = [NSCharacterSet decimalDigitCharacterSet];
    for (int i = 0; i<mString.length; i++) {
            //substringWithRange截取子字符串
        NSString *ch = [mString substringWithRange:NSMakeRange(i, 1)];
        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:ch];
        if ([numberSet isSupersetOfSet:set]) {
                //是数字
        }else{
                //不是数字
            [mString deleteCharactersInRange:NSMakeRange(i, 1)];
            i--;
        }
    }
    return mString;
}




- (void)dealloc {
    [_nameLabel release];
    [_phoneLabel release];
    [super dealloc];
}
@end






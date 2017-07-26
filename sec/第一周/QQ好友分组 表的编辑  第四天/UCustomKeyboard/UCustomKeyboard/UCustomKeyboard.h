//
//  UCustomKeyboard.h
//  UCustomKeyboard
//
//  Created by sun huayu on 12-11-30.
//  Copyright (c) 2012年 sun huayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UCustomKeyboard : UIView{
    UITextField *_textField;
}


@property (nonatomic, assign) UITextField *textField;
@property (nonatomic,assign) id<UITextInput>delegate;

@end










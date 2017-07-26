//
//  UCustomKeyboard.m
//  UCustomKeyboard
//
//  Created by sun huayu on 12-11-30.
//  Copyright (c) 2012年 sun huayu. All rights reserved.
//

#import "UCustomKeyboard.h"

@implementation UCustomKeyboard

- (id)init{
    self = [super init];
    if (self) {
        NSArray *aNib = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        self.frame = CGRectMake(0, 0, 320, 200);
        UIView *view = [aNib objectAtIndex:0];
        [self addSubview:view];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)butClick:(UIButton *)sender{
    switch (sender.tag) {
        case 11:
            [self.delegate deleteBackward];
            [[UIDevice currentDevice] playInputClick];
            break;
        case 12:
            if ([_textField.delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
                if ([_textField.delegate textFieldShouldReturn:_textField]) {
                    //[_textField resignFirstResponder];
                }
            }
            break;
        case 10:
            [self.delegate insertText:[NSString stringWithFormat:@"%d", 0]];
            [[UIDevice currentDevice] playInputClick];
            break;
        default:
            [self.delegate insertText:[NSString stringWithFormat:@"%d", sender.tag]];
            [[UIDevice currentDevice] playInputClick];
            break;
    }
}

- (id<UITextInput>)delegate {
    return _textField;
}

- (UITextField *)textField {
    return _textField;
}

- (void)setTextField:(UITextField *)textField {
    _textField = textField;
    _textField.inputView = self;
}



- (BOOL)enableInputClicksWhenVisible {
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

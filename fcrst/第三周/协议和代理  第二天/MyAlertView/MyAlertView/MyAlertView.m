//
//  MyAlertView.m
//  MyAlertView
//
//  Created by sunhuayu on 15/7/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "MyAlertView.h"

@implementation MyAlertView


- (instancetype)initWithTitle:(NSString *)title button1:(NSString *)button1Title button2:(NSString *)button2Title delegate:(id<MyAlertViewDelegate>)delegate{
    self = [super initWithFrame:CGRectMake(0, 0, 260, 200)];
    if (self) {
        _delegate = delegate;
        
        self.backgroundColor = [UIColor greenColor];
        //标题
        UILabel *titileLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 260, 30)];
        titileLabel.textAlignment = NSTextAlignmentCenter;
        titileLabel.text = title;
        [self addSubview:titileLabel];
        
        //两个按钮
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
        button1.frame = CGRectMake(20, 100, 100, 30);
        [button1 setTitle:button1Title forState:UIControlStateNormal];
        button1.backgroundColor = [UIColor yellowColor];
        button1.tag = 0;
        [button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button1];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
        button2.frame = CGRectMake(140, 100, 100, 30);
        [button2 setTitle:button2Title forState:UIControlStateNormal];
        button2.backgroundColor = [UIColor yellowColor];
        button2.tag = 1;
        [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button2];
        
    }
    
    return self;
}

//alertView是添加在window上的；
- (void)show{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    [window addSubview:self];
    
    self.center = window.center;
}

- (void)buttonClick:(UIButton *)sender{
    
    //通过调方法把值传给代理对象。
    
    //由于不确定代理对象的类型，就不知道代理对象有哪些方法，所以需要给代理对象添加一个协议限制，强制代理对象实现协议方法。
    
    
    //对于必须的协议方法，可以直接调用，
    //对于可选的协议方法，要先判断代理对象有没有实现这个方法，如果实现了再去调用。
    if ([_delegate respondsToSelector:@selector(clickButtonAtIndex:)]) {
        [_delegate clickButtonAtIndex:sender.tag];
    }
    
    
    
    
    
    
    
    [self removeFromSuperview];
}




@end










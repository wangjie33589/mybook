//
//  MyAlertView.h
//  MyAlertView
//
//  Created by sunhuayu on 15/7/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol 声明一个协议，协议中规定了一些方法，叫做协议方法。

@protocol MyAlertViewDelegate <NSObject>

//@required必须实现的协议方法

//@optional可选的协议方法。满足这个协议时，可以实现也可以不实现。

@optional

- (void)clickButtonAtIndex:(int)buttonIndex;

@end




@interface MyAlertView : UIView{
    //声明一个指针，指向它的代理对象，这样就可以找到代理对象，把值传给它，
    //如果代理类型写死成固定类型，那么就只能代理这个类。
    
    //ViewController      *_delegate;
    
    //如果想要代理任意类型，那么delegate的类型就需要写成 id
    
    //id 是可以指向任意类型的指针。
    //id 可以调用任何已知的方法。
    
    //id后加协议表示这个指针可以指向任何类型，但是这个类型必须满足此协议
    
    id<MyAlertViewDelegate>      _delegate;
    
}



//instance 实例，instancetype实例类型，这个方法拿什么类去调，就是什么类型。

- (instancetype)initWithTitle:(NSString *)title button1:(NSString *)button1Title button2:(NSString *)button2Title delegate:(id<MyAlertViewDelegate>)delegate;



- (void)show;


@end















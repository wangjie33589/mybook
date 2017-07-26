//
//  People.h
//  People
//
//  Created by 孙 化育 on 15-7-15.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//


    //类表示某一些具有相同或类似属性的事物。

    //对象表示某个类的一个具体实例。



    //.h 文件是头文件，头文件中声明类，以及这个类的属性和方法。

#import <Foundation/Foundation.h>

    //@interface 表示声明一个类，People表示这个类的名字， :表示这个类继承于另一个类。  NSObject 表示这个类的父类。

    //花括号中是属性声明区域，声明这个类都有哪些属性。
@interface People : NSObject{
        //声明了一个int型的变量来表示年龄。
    int _age;
    
        //声明了一个字符串类型的变量来表示名字
    NSString *_name;
    
    //声明一个浮点型变量表示身高
    
    
    float _height;
    
        //声明一个布尔型变量表示性别。
        //布尔值表示真假，只有两种情况。
    BOOL _sex;
    
    
        //int,float,BOOL是基本类型，声明变量时不加*，类的变量，声明需要加*。
}


    //属性声明区域结束后，在@end之前，是方法声明区域.

    //声明了一个方法，方法名字叫sleep
- (void)sleep;


    //声明了一个带参数的方法，用来设置名字。
    //括号中是参数的类型，括号后面是参数名字。
- (void)setName:(NSString *)name;

- (void)setAge:(int)age;

- (void)setSex:(BOOL)sex;

    //写一个自我介绍方法
- (void)produceSelf;


    //没有参数，有返回值的方法。
    //声明名字的get方法，用于获得people对象的name属性。
- (NSString *)name;

    //带有4个参数，一个返回值的方法。
    //初始化方法。用于在创建对象的同时给对象的属性赋值。
- (instancetype)initWithName:(NSString *)name age:(int)age height:(float)height sex:(BOOL)sex;



@end









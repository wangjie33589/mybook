//
//  ViewController.h
//  MemoryControl1
//
//  Created by sunhuayu on 15/8/10.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class简易声明一个类，仅仅知道这是一个类，但是不去研究类中的属性和方法。
//一般用于在.h文件中声明一个类型。防止在.h中导入头文件。
//如果使用@class声明一个类，那么在.m中还需要导入这个类的头文件。
@class People;


@interface ViewController : UIViewController{
    
    People      *_p3;
    
    People      *_p5;
    
}


@end












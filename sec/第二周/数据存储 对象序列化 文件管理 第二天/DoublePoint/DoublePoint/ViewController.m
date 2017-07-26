//
//  ViewController.m
//  DoublePoint
//
//  Created by sunhuayu on 15/8/18.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


//双指针，指向指针的指针，作用是可以实现在方法内部给一个方法外部的指针赋值。

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"123";
    //方法调用的参数写的是指针，实际传入方法的是这个指针所指向的对象。方法中会有另外一个指针(参数指针)指向这个对象。
    
    //如果需要在方法内部使用方法外部的指针，就必须通过双指针参数类型，把指针传入方法。
    
    //&写在变量前表示取地址符，获得一个变量的内存地址。
    [self changeString:&str];
    
    NSLog(@"%@",str);
}

//**表示双指针，NSString **表示指向字符串指针的指针。
- (void)changeString:(NSString **)string{
    
    //指针前加*表示获得这个指针所指向的内容。
    *string = @"abc";
}


//- (void)changeString:(NSString *)string{
//    string = @"abc";
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end








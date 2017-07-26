//
//  ViewController.m
//  MemoryControl1
//
//  Created by sunhuayu on 15/8/10.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "People.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc{
    //全部变量的对象 release一般写在dealloc中。
    [_p3 release];
    [_p5 release];
    
    //super dealloc 释放父类的属性，必须写在最后一行。
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    
    //NSLog(@"%lu",sizeof(short));
    
    //*凡是通过alloc，new，copy创建的对象，引用计数为1.
    People *p1 = [[People alloc] init];
    //new 就相当于alloc+init
    //People *p = [People new];
    
    //retainCount对象当前的引用计数。
    NSLog(@"%u",p1.retainCount);
    
    //retain方法使对象引用计数+1.
    [p1 retain];
    
    NSLog(@"%u",p1.retainCount);
    
    //release方法使对象引用计数-1
    [p1 release];
    
    NSLog(@"%u",p1.retainCount);
    
    //当对象引用计数为0时，就会被释放（需要有一个短暂的过程）。
    [p1 release];
    
    
    */
    
    //*内存管理小技巧：retain数量+alloc数量=release的数量。
    
    
    //一个对象该release时没有release，就会造成对象一直存在内存当中，而且无法找到它，这种现象叫做内存泄露。
    People *p2 = [[People alloc] init];
    
    //局部变量对象需要在变量有效范围结束之前release
    [p2 work];
    
    //[p2 release];
    
    
    _p3 = [[People alloc] init];
    
    //如果一个对象不该release时release了，就会导致对象被提前释放，可能造成野指针。（野指针，指向非正常对象的指针。野指针调用任何方法都会崩溃）
   //[_p3 release]
    
    
    //**内存管理基本原则：谁创建谁release，谁使用谁管理。
    People *p4 = [[People alloc] init];
    _p5 = p4;
    [_p5 retain];
    [p4 work];
    [p4 release];
    
    
    //当一个指针改变指向时，如果之前指向的是一个对象，那么要先对这个对象release，再指向新的对象，
    People *p3 = [[People alloc] init];
    [p3 release];
    p3 = [[People alloc] init];
    
    
}


- (IBAction)buttonClick:(UIButton *)sender {
    //[_p3 work];
    [_p5 work];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end














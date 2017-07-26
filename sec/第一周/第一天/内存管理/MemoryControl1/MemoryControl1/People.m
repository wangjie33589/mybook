//
//  People.m
//  MemoryControl1
//
//  Created by sunhuayu on 15/8/10.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "People.h"

@implementation People

//dealloc方法，当对象将要被释放时，由系统调用(永远不要手动调用dealloc)。
//需要验证一个对象有没有被释放，只需要看它的dealloc方法没有被调用。
- (void)dealloc{
    NSLog(@"我被释放了");
    
    [super dealloc];
}



- (void)work{
    NSLog(@"正在工作");
}

@end












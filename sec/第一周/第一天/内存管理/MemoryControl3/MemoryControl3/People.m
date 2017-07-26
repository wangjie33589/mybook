//
//  People.m
//  MemoryControl3
//
//  Created by sunhuayu on 15/8/10.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "People.h"

@implementation People

+ (People *)createPeople{
    
    People *p = [[People alloc] init];
    
    //延迟release。先把对象放入自动释放池，当事件循环结束时，自动释放池会进行排干，对池中所有对象release。
    [p autorelease];
    
    return p;
    
}








@end






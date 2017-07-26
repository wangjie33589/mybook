//
//  Student.m
//  NotificationRemove
//
//  Created by sunhuayu on 15/8/14.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)init{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveClassoverNotification) name:@"classover" object:nil];
    }
    
    return self;
}

- (void)receiveClassoverNotification{
    NSLog(@"我是%@,我要去%@",_name,_hobby);
}


- (void)dealloc{
    [_name release];
    [_hobby release];
    
    //取消某个对象的通知监听（把这个对象从通知中心移除）
    
    //*在dealloc中，如果这个对象是通知的监听者，那么必须移除通知监听。
    
    //移除某个监听者所有的通知监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    //移除某个通知的监听
    //[[NSNotificationCenter defaultCenter] removeObserver: name: object:];
    
    [super dealloc];
}



@end














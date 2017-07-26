//
//  Woman.m
//  PeopleProperty
//
//  Created by 孙 化育 on 15-7-15.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "Woman.h"


@implementation Woman

- (BOOL)findBoyFriend:(Man *)boy;{
        //&&表示并且，连接两个BOOL值或BOOL表达式，当两个值都为真时返回真。
    if (boy.height>170&&boy.height<180) {
        NSLog(@"身高符合要求");
    }else{
        NSLog(@"身高不符合要求");
        return NO;
    }
    
    
    if (boy.age<18) {
        NSLog(@"年龄太小了");
        return NO;
    }else{
        if (boy.age>30) {
            NSLog(@"年龄太大了");
            return NO;
        }else{
            NSLog(@"年龄正合适");
        }
    }
    return YES;
}


- (ZYPeople *)makeBaby{
    ZYPeople *baby = [[ZYPeople alloc] init];
    baby.age = 0;
    
    baby.sex = arc4random()%2;
    
    return baby;
}


@end












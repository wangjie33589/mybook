//
//  Man.m
//  PeopleProperty
//
//  Created by 孙 化育 on 15-7-15.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "Man.h"

@implementation Man

- (void)produceSelf{
        //super 父类，调用父类的produceSelf方法。
    [super produceSelf];
    
    NSLog(@"我抽%@牌的香烟",_cigarette);
}

@end









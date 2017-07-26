//
//  ZYRecord.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ZYRecord.h"

@implementation ZYRecord

- (void)dealloc{
    [_name release];
    [_kind release];
    [_remark release];
    [super dealloc];
}

@end

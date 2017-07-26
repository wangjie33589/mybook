//
//  ZYDish.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ZYDish.h"

@implementation ZYDish

- (void)dealloc{
    [_name release];
    [_unit release];
    [_picName release];
    [_kind release];
    [super dealloc];
}

@end

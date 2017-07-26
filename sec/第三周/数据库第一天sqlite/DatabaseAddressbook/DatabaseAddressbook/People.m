//
//  People.m
//  DatabaseAddressbook
//
//  Created by sunhuayu on 15/8/24.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "People.h"

@implementation People

- (void)dealloc{
    [_name release];
    [_number release];
    [super dealloc];
}

@end

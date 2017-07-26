//
//  People.m
//  AddressBookGetAll
//
//  Created by 孙 化育 on 15-6-17.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "People.h"

@implementation People

- (void)dealloc{
    [_name release];
    [_phone release];
    [super dealloc];
}

@end




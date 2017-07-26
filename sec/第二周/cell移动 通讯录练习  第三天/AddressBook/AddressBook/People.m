//
//  People.m
//  AddressBook
//
//  Created by sunhuayu on 15/8/19.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "People.h"

@implementation People

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_phoneNumber forKey:@"phoneNumber"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        _name = [[aDecoder decodeObjectForKey:@"name"] copy];
        _phoneNumber = [[aDecoder decodeObjectForKey:@"phoneNumber"] copy];
    }
    return self;
}


- (void)dealloc{
    [_name release];
    [_phoneNumber release];
    [super dealloc];
}

@end




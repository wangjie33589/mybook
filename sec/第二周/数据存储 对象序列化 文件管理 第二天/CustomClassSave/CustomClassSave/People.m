//
//  People.m
//  CustomClassSave
//
//  Created by sunhuayu on 15/8/18.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "People.h"

@implementation People

//编码方法，系统在对这个对象进行编码(序列化)时，会调用这个方法进行编码，我们需要在这个方法中对对象中的每一个属性进行编码。
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_age forKey:@"age"];
    [aCoder encodeBool:_sex forKey:@"sex"];
}

//解码方法，系统在对一段二进制数据进行解码(反序列化)时会调用这个方法。我们需要再这个方法中把解码之后的值赋值给这个对象。
- (id)initWithCoder:(NSCoder *)aDecoder{
    //如果父类也声明了NSCoding协议，这里需要些super initWithCoder。
    self = [super init];
    if (self) {
        _name = [[aDecoder decodeObjectForKey:@"name"] copy];
        _age = [aDecoder decodeIntForKey:@"age"];
        _sex = [aDecoder decodeBoolForKey:@"sex"];
        
    }
    
    return self;
}

//description方法，表示这个对象在NSLog输出时输出的内容，默认为内存地址.
- (NSString *)description{
    return [NSString stringWithFormat:@"%@,%d,%@",_name,_age,_sex?@"男":@"女"];
    
}

- (void)dealloc{
    [_name release];
    [super dealloc];
}


@end









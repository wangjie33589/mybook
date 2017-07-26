//
//  People.m
//  People
//
//  Created by 孙 化育 on 15-7-15.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

    //.m文件表示类文件，类文件中实现这个类的方法，在.h文件中声明的方法，都需要在.m文件中实现。

#import "People.h"
@implementation People
- (void)sleep{
    NSLog(@"正在睡觉");
}

- (void)setName:(NSString *)name{
    _name = name;
}

- (void)setAge:(int)age{
    _age = age;
}

- (void)setSex:(BOOL)sex{
    _sex = sex;
}

- (void)produceSelf{
//    if (_sex == YES) {
//        NSLog(@"我叫%@,今年%d岁,身高%f,性别男",_name,_age,_height);
//    }else{
//        NSLog(@"我叫%@,今年%d岁,身高%f,性别女",_name,_age,_height);
//    }
    
        //?+: 表示三母运算符 ,?前是一个BOOL值或BOOL表达式，问号后是两个值，当BOOL值为真时，取第一个值，为假时取第二个值。
    
    NSLog(@"我叫%@,今年%d岁,身高%f,性别%@",_name,_age,_height,_sex?@"男":@"女");
}

- (NSString *)name{
    
        //对于没有返回值的方法，可以不写return。有返回值的方法，必须return一个符合返回类型的数据。
        //return之后方法立刻退出。
    //NSLog(@"12345===%@",%@),
    return _name;
}

- (instancetype)initWithName:(NSString *)name age:(int)age height:(float)height sex:(BOOL)sex{
        //先执行父类的初始化
    self = [super init];
        //如果父类初始化成功，再对自己进行初始化，把初始化方法中的参数值设置为自己的属性值。
    //NSLog(@"")
    
    if (self) {
        _name = name;
        _age = age;
        _height = height;
        _sex = sex;
    }
    return self;
}


@end









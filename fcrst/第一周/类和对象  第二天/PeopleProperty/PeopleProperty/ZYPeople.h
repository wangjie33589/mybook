//
//  ZYPeople.h
//  PeopleProperty
//
//  Created by 孙 化育 on 15-7-15.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <Foundation/Foundation.h>

    //NSObject是OC语言中的基础类，也就是所有类的最终父类。

@interface ZYPeople : NSObject{
    NSString *_nickName;
}

    //@property作用：声明一个属性，属性的名字前会加一个_,同时给这个属性自动生成set和get方法。

    //字符串property用copy
@property(nonatomic,copy)NSString *name;

    //基本类型property用assign
@property (nonatomic,assign)int age;

@property (nonatomic,assign)float height;
@property (nonatomic,assign)BOOL sex;


- (void)produceSelf;


@end












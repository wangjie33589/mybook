//
//  Man.h
//  PeopleProperty
//
//  Created by 孙 化育 on 15-7-15.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "ZYPeople.h"
    //Man继承于ZYPeople。
    //当一个类A继承于另外一个类B时，那么A中就包含了B中所有的方法和属性。

@interface Man : ZYPeople{
        //父类中存在的属性名字，子类中不能再定义。
        //NSString *_nickName;
}

    //子类在父类的基础上可以扩展新的属性和方法

@property (nonatomic,copy)NSString *cigarette;



@end











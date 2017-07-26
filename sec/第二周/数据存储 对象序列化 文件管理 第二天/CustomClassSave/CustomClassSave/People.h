//
//  People.h
//  CustomClassSave
//
//  Created by sunhuayu on 15/8/18.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>


//就像要被转成二进制数据就必须实现NSCoding协议。
@interface People : NSObject<NSCoding>

@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)int age;
@property (nonatomic,assign)BOOL sex;


@end















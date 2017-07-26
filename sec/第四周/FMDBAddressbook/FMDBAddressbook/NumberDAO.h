//
//  NumberDAO.h
//  FMDBAddressbook
//
//  Created by sunhuayu on 15/8/26.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberDAO : NSObject

//给某个联系人添加一个电话
+ (void)insertNumber:(NSString *)number forPeople:(int)peopleID;


//查询某个人的所有电话号码
+ (NSArray *)selectAllNumbersOfPeople:(int)peopleID;


//删除某个联系人的某个电话
+ (void)deleteNumber:(NSString *)number ofPeople:(int)peopleID;


//删除某个人的所有电话
+ (void)deleteNumberOfPeople:(int)peopleID;


@end









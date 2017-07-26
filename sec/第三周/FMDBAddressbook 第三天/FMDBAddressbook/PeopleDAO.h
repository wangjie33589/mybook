//
//  PeopleDAO.h
//  FMDBAddressbook
//
//  Created by sunhuayu on 15/8/26.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>


//DAO data access object,数据访问对象。

@interface PeopleDAO : NSObject


//添加一个联系人
+ (void)insertPeople:(NSString *)name;

//查询当前的最大id，（刚插入的数据，自增列的值一定是最大的）
+ (NSInteger)selectMaxPeopleID;


//查询所有联系人
+ (NSArray *)selectAllPeople;


//删除某个联系人
+ (void)deletePeople:(int)peopleID;


@end













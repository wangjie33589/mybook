//
//  DatabaseUtil.h
//  FMDBAddressbook
//
//  Created by sunhuayu on 15/8/26.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DatabaseUtil : NSObject{
    
    //实例变量
    //NSString            *_name;
}


//获得FMDB对象。为了在表工具类DAO中获取数据库对象。
+ (FMDatabase *)shareDB;


//创建表
+ (void)createTableIfNotExists;





@end











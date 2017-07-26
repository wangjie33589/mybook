//
//  DatabaseUtil.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"


@interface DatabaseUtil : NSObject

//把数据库文件从工程文件夹中复制到Documents文件夹中(如果有必要)
+ (void)moveDatabaseFileIntoDocumentsIfNeeded;

+ (FMDatabase *)shareDB;





@end










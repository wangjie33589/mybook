//
//  DatabaseUtil.m
//  FMDBAddressbook
//
//  Created by sunhuayu on 15/8/26.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "DatabaseUtil.h"

//全局变量
FMDatabase *__db = nil;

@implementation DatabaseUtil

+ (FMDatabase *)shareDB{
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.sqlite"];
    
    if (!__db) {
        __db = [[FMDatabase alloc] initWithPath:path];
    }
    
    return __db;
}

+ (void)createTableIfNotExists{
    //在-方法中，self表示当前调用方法的对象。
    //在+方法中，self表示当前的类。
    FMDatabase *db = [self shareDB];
    
    [db open];
    
    //设置缓存查询，提高重复查询时的效率
    //[db setShouldCacheStatements:YES];
    
    NSString *sql1 = @"CREATE TABLE IF NOT EXISTS People(people_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT)";
    
    [db executeUpdate:sql1];
    
    NSString *sql2 = @"CREATE TABLE IF NOT EXISTS Number(people_id INTEGER,number TEXT)";
    
    [db executeUpdate:sql2];
    
    [db close];
    
    
}



@end












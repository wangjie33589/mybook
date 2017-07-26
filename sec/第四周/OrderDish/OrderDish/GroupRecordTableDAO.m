//
//  GroupRecordTableDAO.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/30.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "GroupRecordTableDAO.h"
#import "DatabaseUtil.h"

@implementation GroupRecordTableDAO

+ (int)insetRepastRecordWithDate:(NSString *)date time:(NSString *)time room:(NSString *)room{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO group_recordTable (date,time,room)VALUES('%@','%@','%@')",date,time,room];
    
    [db executeUpdate:sql];
    
    sql = @"SELECT MAX(id) FROM group_recordTable";
    FMResultSet *set = [db executeQuery:sql];
    [set next];
    int maxID = [set intForColumnIndex:0];
    
    [set close];
    [db close];
    
    return maxID;
    
}

@end








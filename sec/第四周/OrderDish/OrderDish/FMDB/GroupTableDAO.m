//
//  GroupTableDAO.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "GroupTableDAO.h"
#import "DatabaseUtil.h"

@implementation GroupTableDAO

+ (NSArray *)selectAllKindsOfGroup:(int)groupID{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM groupTable WHERE id = %d",groupID];
    
    FMResultSet *set = [db executeQuery:sql];
    
    [set next];
    
    NSString *name = [set stringForColumn:@"name"];
    
    [set close];
    [db close];
    
    NSArray *array = [name componentsSeparatedByString:@"|"];
    
    return array;
}

@end










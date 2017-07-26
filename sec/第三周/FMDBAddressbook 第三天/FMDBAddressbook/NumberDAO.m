//
//  NumberDAO.m
//  FMDBAddressbook
//
//  Created by sunhuayu on 15/8/26.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "NumberDAO.h"
#import "DatabaseUtil.h"

@implementation NumberDAO

+ (void)insertNumber:(NSString *)number forPeople:(int)peopleID{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO Number VALUES(%d,'%@')",peopleID,number];
    
    [db executeUpdate:sql];
    
    [db close];
}




+ (NSArray *)selectAllNumbersOfPeople:(int)peopleID{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM Number WHERE people_id=%d",peopleID];
    
    FMResultSet *set = [db executeQuery:sql];
    NSMutableArray *array = [NSMutableArray array];
    while ([set next]) {
        NSString *number = [set stringForColumn:@"number"];
        [array addObject:number];
    }
    [set close];
    [db close];
    
    //根据一个数组中的内容创建另一个数组。
    NSArray *arr1 = [NSArray arrayWithArray:array];
    
    return arr1;
}


+ (void)deleteNumber:(NSString *)number ofPeople:(int)peopleID{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM Number WHERE people_id = %d AND number = '%@'",peopleID,number];
    
    [db executeUpdate:sql];
    
    [db close];
}


+ (void)deleteNumberOfPeople:(int)peopleID{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM Number WHERE people_id = %d",peopleID];
    [db executeUpdate:sql];
    [db close];
}



@end









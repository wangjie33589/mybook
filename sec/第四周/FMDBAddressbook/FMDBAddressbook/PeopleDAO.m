//
//  PeopleDAO.m
//  FMDBAddressbook
//
//  Created by sunhuayu on 15/8/26.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "PeopleDAO.h"
#import "DatabaseUtil.h"

@implementation PeopleDAO

+ (void)insertPeople:(NSString *)name{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO People (name)VALUES('%@')",name];
    
    [db executeUpdate:sql];
    
    [db close];
}

+ (NSInteger)selectMaxPeopleID{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = @"SELECT max(people_id) FROM People";
    
    FMResultSet *set = [db executeQuery:sql];
    
    [set next];
    
    int maxID = [set intForColumnIndex:0];
    
    [set close];
    [db close];
    
    return maxID;
    
}

+ (NSArray *)selectAllPeople;{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    NSString *sql = @"SELECT * FROM People";
    
    FMResultSet *set = [db executeQuery:sql];
    
    NSMutableArray *array = [NSMutableArray array];
    
    while ([set next]) {
        People *p = [[People alloc] init];
        p.peopleID = [set intForColumn:@"people_id"];
        p.name = [set stringForColumn:@"name"];
        [array addObject:p];
        [p release];
    }
    [set close];
    [db close];
    return array;
    
}


+ (void)deletePeople:(int)peopleID{
    FMDatabase *db = [DatabaseUtil shareDB];
    
    [db open];
    
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM People WHERE people_id = %d",peopleID];
    [db executeUpdate:sql];
    [db close];
}



@end













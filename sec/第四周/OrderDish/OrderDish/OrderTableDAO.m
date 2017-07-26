//
//  OrderTableDAO.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "OrderTableDAO.h"
#import "DatabaseUtil.h"
#import "ZYRecord.h"

@implementation OrderTableDAO

+ (void)orderDish:(ZYDish *)dish{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM orderTable WHERE id = %d",dish.dishID];
    
    FMResultSet *set = [db executeQuery:sql];
    
    if ([set next]) {
        //已经点过这道菜了
        int count = [set intForColumn:@"menuNum"];
        count++;
        sql = [NSString stringWithFormat:@"UPDATE orderTable SET menuNum=%d WHERE id = %d",count,dish.dishID];
        [db executeUpdate:sql];
    }else{
        //没有点过这道菜
        sql = [NSString stringWithFormat:@"INSERT INTO orderTable VALUES(%d,'%@','%d','%@',1,'')",dish.dishID,dish.name,dish.price,dish.kind];
        [db executeUpdate:sql];
    }
    
    [set close];
    [db close];
    
}

+ (int)selectCountOfOrderedDishes{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = @"SELECT COUNT(*) FROM orderTable";
    
    FMResultSet *set = [db executeQuery:sql];
    
    [set next];
    
    int count = [set intForColumnIndex:0];
    
    [set close];
    [db close];
    return count;
}

+ (NSMutableArray *)selectAllOrderedDishes{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    NSString *sql = @"SELECT * FROM orderTable";
    NSMutableArray *array = [NSMutableArray array];
    FMResultSet *set = [db executeQuery:sql];
    
    while ([set next]) {
        ZYRecord *record = [[ZYRecord alloc] init];
        record.recordID = [set intForColumn:@"id"];
        record.name = [set stringForColumn:@"menuName"];
        record.price = [set intForColumn:@"Price"];
        record.kind = [set stringForColumn:@"kind"];
        record.number = [set intForColumn:@"menuNum"];
        record.remark = [set stringForColumn:@"remark"];
        [array addObject:record];
        [record release];
    }
    [set close];
    [db close];
    return array;
}

+ (void)updateDishNumber:(int)number forDish:(int)recordID{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = [NSString stringWithFormat:@"UPDATE orderTable SET menuNum = %d WHERE id = %d",number,recordID];
    
    [db executeUpdate:sql];
    [db close];
}

+ (void)updateDishRemark:(NSString *)remark forDish:(int)recordID{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = [NSString stringWithFormat:@"UPDATE orderTable SET remark = '%@' WHERE id = %d",remark,recordID];
    
    [db executeUpdate:sql];
    [db close];
}

+ (void)deleteDish:(int)recordID{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM orderTable WHERE id = %d",recordID];
    [db executeUpdate:sql];
    [db close];
}


+ (void)deleteAllDishes{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    NSString *sql = @"DELETE FROM orderTable";
    [db executeUpdate:sql];
    [db close];
}

@end











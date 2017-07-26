//
//  MenuTableDAO.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "MenuTableDAO.h"
#import "ZYDish.h"

@implementation MenuTableDAO

+ (NSArray *)selectAllDishOfKind:(NSString *)kind{
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM menuTable WHERE iKind='%@'",kind];
    
    FMResultSet *set = [db executeQuery:sql];
    
    NSMutableArray *array = [NSMutableArray array];
    while ([set next]) {
        ZYDish *dish = [[ZYDish alloc] init];
        dish.dishID = [set intForColumn:@"id"];
        dish.groupID = [set intForColumn:@"groupID"];
        dish.name = [set stringForColumn:@"name"];
        dish.price = [set intForColumn:@"price"];
        dish.kind = [set stringForColumn:@"iKind"];
        dish.unit = [set stringForColumn:@"unit"];
        dish.picName = [set stringForColumn:@"picName"];
        
        [array addObject:dish];
        [dish release];
    }
    [set close];
    [db close];
    return array;
    
}

@end







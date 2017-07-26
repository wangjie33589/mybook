//
//  RecordTableDAO.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/30.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "RecordTableDAO.h"
#import "DatabaseUtil.h"
#import "OrderTableDAO.h"
#import "ZYRecord.h"

@implementation RecordTableDAO

+ (void)saveOrderedDishesIntoHistoryOrderWithRepastID:(int)repastID{
    //先查询所有已点的菜
    NSArray *array = [OrderTableDAO selectAllOrderedDishes];
    
    FMDatabase *db = [DatabaseUtil shareDB];
    [db open];
    
    for (ZYRecord *record in array) {
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO recordTable (stateNum,menuName,menuPrice,menuKind,menuNum,menuRemark,groupID)VALUES (1,'%@',%d,'%@',%d,'%@',%d)",record.name,record.price,record.kind,record.number,record.remark,repastID];
        [db executeUpdate:sql];
    }
    
    [db close];
    
}




@end







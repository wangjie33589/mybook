//
//  RecordTableDAO.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/30.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecordTableDAO : NSObject

//把已经点的菜存入历史菜单(送单)
+ (void)saveOrderedDishesIntoHistoryOrderWithRepastID:(int)repastID;

@end

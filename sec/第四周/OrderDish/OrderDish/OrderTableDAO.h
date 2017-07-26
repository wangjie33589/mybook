//
//  OrderTableDAO.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYDish.h"

@interface OrderTableDAO : NSObject

//点一道菜
+ (void)orderDish:(ZYDish *)dish;


//查询已经点了多少种菜
+ (int)selectCountOfOrderedDishes;


//查询所有已点的菜
+ (NSMutableArray *)selectAllOrderedDishes;


//修改一道已经点的菜的数量
+ (void)updateDishNumber:(int)number forDish:(int)recordID;

//修改一道已经点的菜的备注
+ (void)updateDishRemark:(NSString *)remark forDish:(int)recordID;


//删除一道已点的菜
+ (void)deleteDish:(int)recordID;


//删除所有已点的菜
+ (void)deleteAllDishes;


@end







//
//  MenuTableDAO.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseUtil.h"

@interface MenuTableDAO : NSObject


//查询某种菜
+ (NSArray *)selectAllDishOfKind:(NSString *)kind;



@end

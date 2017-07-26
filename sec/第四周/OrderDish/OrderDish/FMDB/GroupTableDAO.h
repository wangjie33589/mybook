//
//  GroupTableDAO.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupTableDAO : NSObject

//根据索引值查找某组菜的所有种类
+ (NSArray *)selectAllKindsOfGroup:(int)groupID;



@end

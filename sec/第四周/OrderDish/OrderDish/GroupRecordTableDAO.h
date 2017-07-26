//
//  GroupRecordTableDAO.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/30.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupRecordTableDAO : NSObject

//生成一条就餐记录，并返回这条记录的id
+ (int)insetRepastRecordWithDate:(NSString *)date time:(NSString *)time room:(NSString *)room;


@end









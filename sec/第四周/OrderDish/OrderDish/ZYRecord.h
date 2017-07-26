//
//  ZYRecord.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYRecord : NSObject

@property (nonatomic,assign)int recordID;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)int price;
@property (nonatomic,copy)NSString *kind;
@property (nonatomic,assign)int number;
@property (nonatomic,copy)NSString *remark;

@end







//
//  ZYDish.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYDish : NSObject

@property (nonatomic,assign)int dishID;
@property (nonatomic,assign)int groupID;

@property (nonatomic,copy)NSString *kind;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)int price;
@property (nonatomic,copy)NSString *unit;
@property (nonatomic,copy)NSString *picName;

@end









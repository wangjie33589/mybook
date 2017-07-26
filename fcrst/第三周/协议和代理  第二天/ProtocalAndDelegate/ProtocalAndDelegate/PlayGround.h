//
//  PlayGround.h
//  ProtocalAndDelegate
//
//  Created by sunhuayu on 15/7/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PlayGroundDelegate <NSObject>

- (void)speak;

@end


//舞台
@interface PlayGround : NSObject


//让某个对象上台演讲，可以是任何类型，但是必须会说话(实现speak方法)
- (void)letSpeak:(id<PlayGroundDelegate>)speaker;


@end











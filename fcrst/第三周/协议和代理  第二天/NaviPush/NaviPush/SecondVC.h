//
//  SecondVC.h
//  NaviPush
//
//  Created by sunhuayu on 15/7/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SecondVCDelegate <NSObject>

- (void)changeColor:(UIColor *)color;

@end



@interface SecondVC : UIViewController<SecondVCDelegate>


@property (nonatomic,strong)id<SecondVCDelegate> previousVC;


@end










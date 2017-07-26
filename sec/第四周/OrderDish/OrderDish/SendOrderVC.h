//
//  SendOrderVC.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/30.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendOrderVC : UIViewController{
    
    IBOutlet UIButton *_roomButton;
}

- (void)selectRoom:(NSString *)room;

@end

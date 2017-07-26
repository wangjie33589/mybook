//
//  DetailVC.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYDish.h"

@interface DetailVC : UIViewController{
    
    IBOutlet UIImageView *_imageView;
    IBOutlet UILabel *_nameLabel;
    IBOutlet UILabel *_pricaLabel;
}

@property (nonatomic,retain)ZYDish *dish;



@end

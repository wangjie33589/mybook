//
//  MyOrderCell.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrderCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UILabel *indexLabel;
@property (retain, nonatomic) IBOutlet UILabel *kindLabel;

@property (retain, nonatomic) IBOutlet UILabel *nameLabel;
@property (retain, nonatomic) IBOutlet UILabel *priceLabel;
@property (retain, nonatomic) IBOutlet UITextField *numberField;
@property (retain, nonatomic) IBOutlet UITextField *remarkField;

@end

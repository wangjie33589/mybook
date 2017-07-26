//
//  MyOrderCell.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "MyOrderCell.h"

@implementation MyOrderCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_indexLabel release];
    [_nameLabel release];
    [_priceLabel release];
    [_kindLabel release];
    [_numberField release];
    [_remarkField release];
    [super dealloc];
}
@end

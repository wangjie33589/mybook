//
//  MyCell.m
//  CustomCell3
//
//  Created by sunhuayu on 15/8/11.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

//仅当使用alloc创建初始化时调用，从xib中加载时不调用。
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _headerImageView.layer.cornerRadius = 30;
        _headerImageView.layer.masksToBounds = YES;
    }
    
    return self;
}

//当cell从xib中加载时，初始化代码写在awakeFromNib中
- (void)awakeFromNib {
    // Initialization code
    _headerImageView.layer.cornerRadius = 30;
    _headerImageView.layer.masksToBounds = YES;
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_headerImageView release];
    [_nameLabel release];
    [_timeLabel release];
    [_messageLabel release];
    [_pic1 release];
    [_pic2 release];
    [_shareButton release];
    [_supportButton release];
    [super dealloc];
}
@end

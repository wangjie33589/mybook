//
//  MyCell.m
//  CustomCell2
//
//  Created by sunhuayu on 15/8/11.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        
        //设置view的圆角半径。
        _headerImageView.layer.cornerRadius = 20;
        _headerImageView.layer.masksToBounds = YES;
        
        [self.contentView addSubview:_headerImageView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 200, 20)];
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:_nameLabel];
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 20)];
        _messageLabel.font = [UIFont systemFontOfSize:12];
        _messageLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_messageLabel];
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 10, 60, 20)];
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_timeLabel];
        
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(280, 30, 20, 20)];
        _countLabel.backgroundColor = [UIColor redColor];
        _countLabel.textAlignment = NSTextAlignmentCenter;
        _countLabel.layer.cornerRadius = 10;
        _countLabel.layer.masksToBounds = YES;
        
        [self.contentView addSubview:_countLabel];
    }
    return self;
}



- (void)dealloc{
    [_countLabel release];
    [_nameLabel release];
    [_headerImageView release];
    [_messageLabel release];
    [_timeLabel release];
    [super dealloc];
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    _countLabel.backgroundColor = [UIColor redColor];

    // Configure the view for the selected state
}

@end













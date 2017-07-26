//
//  SelfCell.m
//  BubbleChat
//
//  Created by sunhuayu on 15/8/17.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "SelfCell.h"

@implementation SelfCell

- (void)dealloc{
    [_messageLabel release];
    [_headerImageView release];
    [_bubbleImageView release];
    [super dealloc];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(272, 8, 40, 40)];
        [self addSubview:_headerImageView];
        _headerImageView.layer.cornerRadius = 20;
        _headerImageView.layer.masksToBounds = YES;
        
        
        _bubbleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _bubbleImageView.image = [[UIImage imageNamed:@"bubbleSelf.png"] stretchableImageWithLeftCapWidth:25 topCapHeight:20];
        [self addSubview:_bubbleImageView];
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _messageLabel.numberOfLines = 0;
        _messageLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_messageLabel];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

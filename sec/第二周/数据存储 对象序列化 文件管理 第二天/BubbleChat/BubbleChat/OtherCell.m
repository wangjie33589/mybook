//
//  OtherCell.m
//  BubbleChat
//
//  Created by sunhuayu on 15/8/17.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "OtherCell.h"

@implementation OtherCell

- (void)awakeFromNib {
    
    self.headerImageView.layer.cornerRadius = 20;
    self.headerImageView.layer.masksToBounds = YES;
    
    UIImage *image = [UIImage imageNamed:@"bubble.png"];
    
    //设置图片的边帽，当图片拉伸时，只按照边帽位置的像素点进行填充。（保证图片不变形）
    self.bubbleImageView.image = [image stretchableImageWithLeftCapWidth:25 topCapHeight:20];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_headerImageView release];
    [_bubbleImageView release];
    [_mesageLabel release];
    [super dealloc];
}
@end

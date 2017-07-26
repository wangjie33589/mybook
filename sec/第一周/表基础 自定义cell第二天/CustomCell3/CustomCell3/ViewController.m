//
//  ViewController.m
//  CustomCell3
//
//  Created by sunhuayu on 15/8/11.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.rowHeight = 360;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}


//第三种自定义cell方法：使用xib设计自定义cell。创建cell直接从xib中加载(在xib中需要设置cell的重用标示符)。
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
//        cell = [[[MyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
        
        //NSBundle mainBundle 资源束（包含了工程中所有的资源文件）
        //从xib中加载自定义cell
        //这种方法创建的cell必须在xib中指定重用标示符。
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:nil options:nil];
        cell = [arr firstObject];
        NSLog(@"创建了一个cell");
        [cell.shareButton addTarget:self action:@selector(shareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    cell.shareButton.tag = indexPath.row;
    
    cell.headerImageView.image = [UIImage imageNamed:@"ali.png"];
    cell.nameLabel.text = @"孙化育";
    
    return cell;
}

- (void)shareButtonClick:(UIButton *)sender{
    NSLog(@"分享!!第%d行",sender.tag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end

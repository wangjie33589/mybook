//
//  ViewController.m
//  CustomCell2
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
    
    _tableView.rowHeight = 60;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}


//第二种自定义cell的方法：自己创建一个cell类，继承于UITableViewCell，把需要添加的子控件写成cell的属性。
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[MyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
    }
    
    cell.headerImageView.image = [UIImage imageNamed:@"ali.png"];
    cell.nameLabel.text = @"火球";
    cell.messageLabel.text = @"这是一个自定义cell";
    cell.timeLabel.text = @"15:37";
    cell.countLabel.text = @"7";
    
    return cell;
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

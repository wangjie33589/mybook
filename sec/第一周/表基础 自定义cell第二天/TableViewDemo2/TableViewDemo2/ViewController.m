//
//  ViewController.m
//  TableViewDemo2
//
//  Created by sunhuayu on 15/8/11.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //设置tableView的默认行高
    _tableView.rowHeight = 100;
    
    //设置tableView的默认区头高度。
    _tableView.sectionHeaderHeight = 20;
}

//设置某个区的区头高度。
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}


//设置某一行的行高。
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%2 == 0) {
        return 100;
    }else{
        return 50;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"%d区",section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        //cell不同的样式决定了cell自带的子控件的位置。
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        [cell autorelease];
        
    }
    
    cell.imageView.image = [UIImage imageNamed:@"ali.png"];
    
    cell.textLabel.text = @"textLabel";
    
    cell.detailTextLabel.text = @"detail";
    
    //accessoryType cell右侧的图标。
    //cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    //自定义accessoryView
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"3";
    label.textAlignment = NSTextAlignmentCenter;
    cell.accessoryView = label;
    [label release];
    
    
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











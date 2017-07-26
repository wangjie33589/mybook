//
//  ViewController.m
//  CustomCell1
//
//  Created by sunhuayu on 15/8/11.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)dealloc{
    [_tableView release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.rowHeight = 100;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

//第一种自定义cell的方式，直接在UITableViewCell上添加子控件。这种自定义cell的方式适用于对系统cell修改不大的情况，如果需要自定义的子控件比较多，那么这种方式就会非常麻烦。

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        //创建自定义控件的代码必须写在创建cell的if语句括号中，然后设置tag，在括号外，通过viewWithTag寻找这个子控件。
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 100, 60)];
        label.tag = 5;
        //label.backgroundColor = [UIColor greenColor];
        
        [cell addSubview:label];
        [label release];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(230, 10, 80, 80)];
        imgView.tag = 6;
        [cell addSubview:imgView];
        [imgView release];
        
    }
    
    UILabel *label = (UILabel *)[cell viewWithTag:5];
    label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    UIImageView *imgView = (UIImageView *)[cell viewWithTag:6];
    
    imgView.image = [UIImage imageNamed:@"ali.png"];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end












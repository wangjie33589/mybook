//
//  ViewController.m
//  PullDownList
//
//  Created by sunhuayu on 15/8/13.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [[NSArray alloc] initWithObjects:@"红色",@"绿色",@"蓝色",@"黑色",@"紫色", nil];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(60, 90, 200, 0) style:UITableViewStylePlain];
    
    [self.view addSubview:_tableView];
    
    //view加边框
    _tableView.layer.borderWidth = 2;
    _tableView.layer.borderColor = [[UIColor redColor] CGColor];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
    }
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *title = [_array objectAtIndex:indexPath.row];
    [_button setTitle:title forState:UIControlStateNormal];
    [self closeTable];
}

- (IBAction)buttonClick:(UIButton *)sender {
    if (!_isOpen) {
        _isOpen = YES;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];
        _tableView.frame = CGRectMake(60, 90, 200, 200);
        [UIView commitAnimations];
    }else{
        [self closeTable];
    }
    
    
}

- (void)closeTable{
    _isOpen = NO;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    _tableView.frame = CGRectMake(60, 90, 200, 0);
    [UIView commitAnimations];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_array release];
    [_button release];
    [super dealloc];
}
@end

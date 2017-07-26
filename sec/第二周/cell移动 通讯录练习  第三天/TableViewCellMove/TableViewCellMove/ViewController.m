//
//  ViewController.m
//  TableViewCellMove
//
//  Created by sunhuayu on 15/8/19.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *shuihu = [NSMutableArray arrayWithObjects:@"宋江",@"卢俊义",@"武松",@"林冲", nil];
    
    NSMutableArray *sanguo = [NSMutableArray arrayWithObjects:@"曹操",@"刘备",@"孙权", nil];
    
    _array = [[NSMutableArray alloc] initWithObjects:shuihu,sanguo, nil];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_array objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    
    cell.textLabel.text = [[_array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}


- (IBAction)editButtonClick:(UIButton *)sender {
    [_tableView setEditing:!_tableView.editing animated:YES];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSString *text = [[_array objectAtIndex:sourceIndexPath.section] objectAtIndex:sourceIndexPath.row];
    
    [[_array objectAtIndex:sourceIndexPath.section] removeObjectAtIndex:sourceIndexPath.row];
    
    [[_array objectAtIndex:destinationIndexPath.section] insertObject:text atIndex:destinationIndexPath.row];
    
}

//设置某一行是否可以移动
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0&&indexPath.row == 0) {
        return NO;
    }else{
        return YES;
    }
}

//设置cell是否能够移动到某一行。
//当cell移动将要发生交换位置时调用。如果允许移动，返回proposedDestinationIndexPath，如果不允许移动，返回sourceIndexPath。
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    
    if (proposedDestinationIndexPath.section == 0&&proposedDestinationIndexPath.row == 0) {
        return sourceIndexPath;
    }else{
        if (sourceIndexPath.section == proposedDestinationIndexPath.section) {
            return proposedDestinationIndexPath;
        }else{
            return sourceIndexPath;
        }
    }
}

//设置某一行是否能够编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0&&indexPath.row == 0) {
        return NO;
    }else{
        return YES;
    }
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

//
//  ViewController.m
//  TableViewSelect
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
    _selectedRow = -1;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
        
        //设置cell的选中样式。
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    //cell重用时，根据这一行的选中状态，来改变cell上的对勾。
    
//    //多选逻辑
//    if (_hasCheckMark[indexPath.row]) {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }else{
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
    
    
    //单选逻辑,如果这一行是选中的行，就打钩，不是就还原
    if (indexPath.row == _selectedRow) {
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}

//当选择了某一行cell时调用。
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%d",indexPath.row);
    
    //取消某行的选中效果。
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 找到某一行位置的cell。
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
//    //多选，选择某行后，对这一行的选中状态取反。
//    _hasCheckMark[indexPath.row] = !_hasCheckMark[indexPath.row];
    
    //单选，选择某行后，把当前选中行数设置为这一行。
    _selectedRow = indexPath.row;
    
    
    //刷新tableView，刷新选中状态。
    [tableView reloadData];
}


//点击了某行cell上的accessoryButton时调用。
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%d行的button",indexPath.row);
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

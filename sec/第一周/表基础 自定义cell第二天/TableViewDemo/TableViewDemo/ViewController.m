//
//  ViewController.m
//  TableViewDemo
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
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_tableView];
    
    //设置tableView的数据源。
    _tableView.dataSource = self;
    
    //设置tableView的代理
    _tableView.delegate = self;
    
}

//设置某个区的区头标题。
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"%d区区头",section];
}

////设置某个区的区头标尾。
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    return [NSString stringWithFormat:@"%d区区尾",section];
//}

//返回tableView的区数。默认为1个区。
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

//返回tableView某个区有多少行。
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}


//tableViewCell的重用机制：每当需要显示一个cell时，先去tableView的重用队列中寻找一个可以重用的cell，如果找到了就直接使用，如果找不到就创建一个使用。


//返回某个区某一行的单元格。当某一行的cell将要出现时调用。
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //UITableViewCell表视图单元格。
    
    //根据重用标示符从重用队列中寻找一个可以重用的cell。如果队列中有可以重用的cell，则返回这个cell，如果没有则返回nil。
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //如果没有找到可以重用的cell，就创建一个cell。
    if (!cell) {
        NSLog(@"创建了一个cell");
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
        
    }
    
    //cell上的属性设置，当重用时不会改变的代码，写在创建cell的if语句中，当重用时有可能发生变化的代码，写在if语句外面。
    
    cell.textLabel.textColor = indexPath.row%2?[UIColor redColor]:[UIColor greenColor];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%d区,第%d行",indexPath.section,indexPath.row];
    
    //NSIndexPath，包含了区号和行号。
    
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  TableViewSave
//
//  Created by sunhuayu on 15/8/19.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"将要消失");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveApplicationEnterBackgroundNotification) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    //NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    //先从硬盘上读取数据，如果没有数据，说明程序是第一次运行，那么就手动创建初始数据。
    //_array = [[user objectForKey:@"array"] retain];
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/file.plist"];
    _array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    if (!_array) {
        _array = [[NSMutableArray alloc] initWithObjects:@"曹操",@"孙权",@"刘备", nil];
    }
    
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
}

- (void)saveData{
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    [user setObject:_array forKey:@"array"];
//    
//    [user synchronize];
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/file.plist"];
    
    [_array writeToFile:path atomically:NO];
    
}

- (void)receiveApplicationEnterBackgroundNotification{
    [self saveData];
}

- (IBAction)addButtonClick:(UIButton *)sender {
    if (_textField.text.length<=0) {
        return;
    }
    
    [_array addObject:_textField.text];
    
    _textField.text = @"";
    
    [_tableView reloadData];
    
    
    
}

- (IBAction)editButtonClick:(UIButton *)sender {
    [_tableView setEditing:!_tableView.editing animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [cell autorelease];
    }
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    return cell;
}

//选中编辑样式。
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 3;
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_array removeObjectAtIndex:indexPath.row];
    [_tableView reloadData];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    NSString *text = [_array objectAtIndex:sourceIndexPath.row];
    
    [_array removeObjectAtIndex:sourceIndexPath.row];
    
    [_array insertObject:text atIndex:destinationIndexPath.row];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_array release];
    [_textField release];
    [_tableView release];
    [super dealloc];
}
@end

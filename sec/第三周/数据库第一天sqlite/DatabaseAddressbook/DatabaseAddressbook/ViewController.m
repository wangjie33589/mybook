//
//  ViewController.m
//  DatabaseAddressbook
//
//  Created by sunhuayu on 15/8/24.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "People.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = [[NSMutableArray alloc] init];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    NSLog(@"%@",NSHomeDirectory());
    
    //准备数据库.
    [self prepareDatabase];
    
    //查询所有联系人
    [self selectAllPeople];
}

- (void)selectAllPeople{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.sqlite"];
    sqlite3_open([path UTF8String], &_db);
    
    NSString *sql = @"SELECT * FROM Addressbook";
    
    sqlite3_stmt *stmt = nil;
    
    sqlite3_prepare(_db, [sql UTF8String], -1, &stmt, nil);
    
    //每次查询时，先清除以前的查询结果。
    [_array removeAllObjects];
    
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        People *p = [[People alloc] init];
        p.peopleID = sqlite3_column_int(stmt, 0);
        const unsigned char *cName = sqlite3_column_text(stmt, 1);
        p.name = [NSString stringWithUTF8String:(const char *)cName];
        const unsigned char *cNumber = sqlite3_column_text(stmt, 2);
        p.number = [NSString stringWithUTF8String:(const char *)cNumber];
        [_array addObject:p];
        [p release];
    }
    
    sqlite3_finalize(stmt);
    
    sqlite3_close(_db);
    
    [_tableView reloadData];
}

- (void)prepareDatabase{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.sqlite"];
    
    if (sqlite3_open([path UTF8String], &_db) == SQLITE_OK) {
        NSLog(@"打开成功");
    }else{
        //NSAssert断言，
        NSAssert(NO, @"数据库打开失败，无法继续执行");
    }
    
    NSString *sql = @"CREATE TABLE IF NOT EXISTS Addressbook (people_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,number TEXT)";
    
    sqlite3_exec(_db, [sql UTF8String], nil, nil, nil);
    
    sqlite3_close(_db);
}

- (IBAction)insertButtonClick:(UIButton *)sender {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.sqlite"];
    sqlite3_open([path UTF8String], &_db);
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO Addressbook (name,number)VALUES('%@','%@')",_nameField.text,_numberField.text];
    
    sqlite3_exec(_db, [sql UTF8String], nil, nil, nil);
    /*
    People *p = [[People alloc] init];
    p.name = _nameField.text;
    p.number = _numberField.text;
    
    //刚插入的数据，自增列的值一定是最大的。
    sql = @"SELECT max(people_id) FROM Addressbook";
    sqlite3_stmt *stmt = nil;
    
    sqlite3_prepare(_db, [sql UTF8String], -1, &stmt, nil);
    
    sqlite3_step(stmt);
    
    p.peopleID = sqlite3_column_int(stmt, 0);
    
    [_array addObject:p];
    [p release];
    [_tableView reloadData];
    
    sqlite3_finalize(stmt);
     
     */
    
    _nameField.text = @"";
    _numberField.text = @"";
    
    [self selectAllPeople];
    
    sqlite3_close(_db);
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"] autorelease];
    }
    People *p = [_array objectAtIndex:indexPath.row];
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = p.number;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //先删除数据库中的数据
    People *p = [_array objectAtIndex:indexPath.row];
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.sqlite"];
    sqlite3_open([path UTF8String], &_db);
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM Addressbook WHERE people_id = %d",p.peopleID];
    
    sqlite3_exec(_db, [sql UTF8String], nil, nil, nil);
    sqlite3_close(_db);
    
    //再删除数据源数组中的数据.
    [_array removeObjectAtIndex:indexPath.row];
    [_tableView reloadData];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_array release];
    [_nameField release];
    [_numberField release];
    [_tableView release];
    [super dealloc];
}
@end

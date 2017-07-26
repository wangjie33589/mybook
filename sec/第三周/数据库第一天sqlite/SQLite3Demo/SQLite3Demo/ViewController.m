//
//  ViewController.m
//  SQLite3Demo
//
//  Created by sunhuayu on 15/8/24.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"


#define SHOW_ALERT(msg) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[alert show];\
[alert release];



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.sqlite"];
    
    //UTF8String把NSString转为c语言的字符串, char *
    //sqlite3_opend打开一个数据库文件(如果文件不存在，就创建并打开),并创建数据库变量，用_db指针指向这个变量。
    int result = sqlite3_open([path UTF8String], &_db);
    
    if (result == SQLITE_OK) {
        NSLog(@"数据库打开成功");
    }else{
        NSLog(@"数据库打开失败");
    }
    
    //创建一张表
    NSString *sql = @"CREATE TABLE IF NOT EXISTS Addressbook(people_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,number TEXT)";
    
    //sqlite3_exec执行一条修改的SQL语句
    if (sqlite3_exec(_db, [sql UTF8String], nil, nil, nil) == SQLITE_OK) {
        NSLog(@"创建表成功");
    }else{
        NSLog(@"创建表失败");
    }
    
    //关闭数据库。
    sqlite3_close(_db);
    
    
}

- (IBAction)insertButtonClick:(UIButton *)sender {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.sqlite"];
    sqlite3_open([path UTF8String], &_db);
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO Addressbook (name,number)VALUES('%@','%@')",_nameField.text,_numberField.text];
    
    if (sqlite3_exec(_db, [sql UTF8String], nil, nil, nil) == SQLITE_OK) {
        SHOW_ALERT(@"插入成功");
        _nameField.text = @"";
        _numberField.text = @"";
    }else{
        SHOW_ALERT(@"插入失败");
    }
    
    sqlite3_close(_db);
}


- (IBAction)selectButtonClick:(UIButton *)sender {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.sqlite"];
    sqlite3_open([path UTF8String], &_db);
    
    NSString *sql = @"SELECT * FROM Addressbook";
    
    //sqlite3_stmt单步执行缓冲区
    sqlite3_stmt *stmt = nil;
    
    //sqlite3_prepare准备执行一条SQL语句，把sql语句和缓冲区绑定。
    sqlite3_prepare(_db, [sql UTF8String], -1, &stmt, nil);
    
    //查询的所有数据需要通过while循环逐个遍历，直到没有下一条数据为止。
    
    //sqlite3_step单步执行，寻找下一条数据。如果存在下一条数据则把这条数据放入缓冲区并返回SQLITE_ROW，如果不存在则返回SQLITE_DONE
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        //sqlite3_column_int取出缓冲区中某列的int型数据
        int peopleID = sqlite3_column_int(stmt, 0);
        //sqlite3_column_text取出缓冲区中某列的文本型数据
        const unsigned char *cName = sqlite3_column_text(stmt, 1);
        //stringWithUTF8String把c字符串转为OC字符串。
        NSString *name = [NSString stringWithUTF8String:(const char *)cName];
        const unsigned char *cNumber = sqlite3_column_text(stmt, 2);
        NSString *number = [NSString stringWithUTF8String:(const char *)cNumber];
        NSLog(@"%d,%@,%@",peopleID,name,number);
    }
    
    //释放缓冲区
    sqlite3_finalize(stmt);
    
    sqlite3_close(_db);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)dealloc {
    [_nameField release];
    [_numberField release];
    [super dealloc];
}
@end






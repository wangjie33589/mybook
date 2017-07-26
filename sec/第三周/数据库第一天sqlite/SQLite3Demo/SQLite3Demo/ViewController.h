//
//  ViewController.h
//  SQLite3Demo
//
//  Created by sunhuayu on 15/8/24.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

//sqlite3是一种专门针对于移动设备使用的轻量级数据库。
//要想在代码中使用sqlite,必须先在工程中导入sqlite3.0库。然后在文件中导入sqlite3.h头文件。

#import <sqlite3.h>

@interface ViewController : UIViewController{
    //声明一个sqlite3数据库变量.
    
    sqlite3         *_db;
    
    
    IBOutlet UITextField *_nameField;
    
    IBOutlet UITextField *_numberField;
    
}


@end














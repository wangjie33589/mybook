//
//  ViewController.h
//  DatabaseAddressbook
//
//  Created by sunhuayu on 15/8/24.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITextField *_nameField;
    IBOutlet UITextField *_numberField;
    IBOutlet UITableView *_tableView;
    
    NSMutableArray      *_array;
    
    sqlite3         *_db;
}




@end










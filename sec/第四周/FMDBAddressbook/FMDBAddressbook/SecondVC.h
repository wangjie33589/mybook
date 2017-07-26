//
//  SecondVC.h
//  FMDBAddressbook
//
//  Created by sunhuayu on 15/8/26.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondVC : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UITextField    *_nameField;
    
    IBOutlet UITextField *_numberField;
    
    IBOutlet UITableView *_tableView;
    
    
}

@property (nonatomic,retain)People *p;

@property (nonatomic,retain)NSArray *array;




@end

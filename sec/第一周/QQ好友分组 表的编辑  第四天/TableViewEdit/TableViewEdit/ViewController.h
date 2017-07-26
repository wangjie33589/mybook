//
//  ViewController.h
//  TableViewEdit
//
//  Created by sunhuayu on 15/8/13.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
    IBOutlet UITextField *_textField;
    
    NSMutableArray      *_array;
    
}


@end


//
//  ViewController.h
//  TableViewSelect
//
//  Created by sunhuayu on 15/8/13.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
    
    
    //实现多选，需要定义一个BOOL数组，记录每一行的选中状态。
    BOOL                _hasCheckMark[20];
    
    //实现单选，需要定义一个int变量，记录哪一行被选中。
    int                 _selectedRow;
}


@end






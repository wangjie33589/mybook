//
//  MainVC.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/27.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
    
    NSArray         *_array;
    
    int             _selectedRow;
    
    
    IBOutlet UIButton *_backButton;
    
}


@end

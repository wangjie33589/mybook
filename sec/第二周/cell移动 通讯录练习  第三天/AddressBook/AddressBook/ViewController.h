//
//  ViewController.h
//  AddressBook
//
//  Created by sunhuayu on 15/8/19.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    
    IBOutlet UITableView *_tableView;
    
    NSMutableArray          *_array;
    
    NSArray                 *_sectionTitleArray;
    
    BOOL                    _isOpen[3];
    
}


@end











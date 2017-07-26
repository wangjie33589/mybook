//
//  ViewController.h
//  QQTableView
//
//  Created by sunhuayu on 15/8/13.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
    
    NSArray             *_friendArray;
    
    NSArray             *_sectionTitleArray;
    
    BOOL                *_isOpen;
    
}


@end











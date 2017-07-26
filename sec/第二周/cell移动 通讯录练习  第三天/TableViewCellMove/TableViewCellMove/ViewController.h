//
//  ViewController.h
//  TableViewCellMove
//
//  Created by sunhuayu on 15/8/19.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
    
    NSMutableArray      *_array;
}


@end


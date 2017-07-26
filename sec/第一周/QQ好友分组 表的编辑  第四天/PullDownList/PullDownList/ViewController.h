//
//  ViewController.h
//  PullDownList
//
//  Created by sunhuayu on 15/8/13.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UIButton *_button;
    
    UITableView     *_tableView;
    
    NSArray         *_array;
    
    BOOL            _isOpen;
}


@end











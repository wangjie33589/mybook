//
//  ViewController.h
//  TableViewDemo
//
//  Created by sunhuayu on 15/8/11.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    //UITableView表视图。用于显示一个列表。
    UITableView         *_tableView;
}


@end


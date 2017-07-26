//
//  ViewController.h
//  AddressBookGetAll
//
//  Created by 孙 化育 on 15-6-17.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>{
    NSMutableArray      *_array;
    
    NSMutableArray      *_resultArray;
    
    NSMutableDictionary *_peopleDic;
    
    IBOutlet UITableView *_tableView;
    
        //UISearchBar搜索条
    UISearchBar         *_searchBar;
    
        //搜索结果展示器
    UISearchDisplayController   *_display;
    
    
}


@end


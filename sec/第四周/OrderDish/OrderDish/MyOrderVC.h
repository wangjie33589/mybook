//
//  MyOrderVC.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrderVC : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>{
    NSMutableArray      *_array;
    
    IBOutlet UITableView *_tableView;
    
    
    IBOutlet UILabel *_priceLabel;
    
}

@end

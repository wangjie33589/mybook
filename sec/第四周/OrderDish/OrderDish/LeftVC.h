//
//  LeftVC.h
//  OrderDish
//
//  Created by sunhuayu on 15/8/27.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftVC : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UIImageView *_kindView;
    
    NSArray             *_sectionTitleArray;
    
    IBOutlet UITableView *_tableView;
    
    NSMutableArray      *_dishArray;
    
    
    //记录当前哪个区是打开的
    int                 _currentOpenSection;
    
    int                 _currentSelectedRow;
    
    IBOutlet UIScrollView *_scrollView;
    
    IBOutlet UILabel *_countLabel;
    
    UIImageView         *_animationView;
}


@property (nonatomic,retain)NSArray *sectionTitleArray;


@property (nonatomic,assign)int index;




@end

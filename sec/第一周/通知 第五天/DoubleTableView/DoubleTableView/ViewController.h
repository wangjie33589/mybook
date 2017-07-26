//
//  ViewController.h
//  DoubleTableView
//
//  Created by sunhuayu on 15/8/14.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITableView *_leftTableView;
    
    IBOutlet UITableView *_rightTableView;
}


@end


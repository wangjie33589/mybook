//
//  ViewController.h
//  BubbleChat
//
//  Created by sunhuayu on 15/8/17.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UIView *_inputView;
    IBOutlet UITableView *_tableView;
    
    IBOutlet UITextField *_textField;
    
    NSMutableArray          *_array;
    
}


@end


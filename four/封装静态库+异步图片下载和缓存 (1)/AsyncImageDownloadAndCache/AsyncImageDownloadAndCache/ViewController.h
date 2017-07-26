//
//  ViewController.h
//  AsyncImageDownloadAndCache
//
//  Created by sunhuayu on 15/10/12.
//  Copyright © 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    NSArray     *_imageArray;
    
    __weak IBOutlet UITableView *_tableView;
    
}


@end









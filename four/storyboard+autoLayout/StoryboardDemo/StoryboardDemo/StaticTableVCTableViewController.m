//
//  StaticTableVCTableViewController.m
//  StoryboardDemo
//
//  Created by sunhuayu on 15/10/21.
//  Copyright © 2015年 sunhuayu. All rights reserved.
//

#import "StaticTableVCTableViewController.h"

@interface StaticTableVCTableViewController ()

@end

@implementation StaticTableVCTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 4) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}






@end

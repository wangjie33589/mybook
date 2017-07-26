//
//  ViewController.m
//  AsyncImageDownloadAndCache
//
//  Created by sunhuayu on 15/10/12.
//  Copyright © 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageArray = @[@"http://img0.bdstatic.com/img/image/shouye/sheying1008.jpg",
                    @"http://img0.bdstatic.com/img/image/shouye/bizhi1008.jpg",
                    @"http://img0.bdstatic.com/img/image/shouye/mingxing1008.jpg",
                    @"http://img0.bdstatic.com/img/image/shouye/chongwu1008.jpg",
                    @"http://img0.bdstatic.com/img/image/shouye/dongman1008.jpg",
                    @"http://img0.bdstatic.com/img/image/shouye/touxiang1008.jpg",
                    @"http://img0.bdstatic.com/img/image/shouye/xiaoqingxin1008.jpg",
                    @"http://img0.bdstatic.com/img/image/shouye/fengjing1008.jpg",
                    @"http://img0.bdstatic.com/img/image/shouye/duorou1008.jpg",
                    @"http://img0.bdstatic.com/img/image/shouye/PPT1008.jpg",];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _imageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSURL *url = [NSURL URLWithString:[_imageArray objectAtIndex:indexPath.row]];
    
    [cell.myImageView setImageWithURL:url];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

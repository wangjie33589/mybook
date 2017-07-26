//
//  SearchVC.m
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/6.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "SearchVC.h"

@interface SearchVC ()

@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _buttonTitleArray = @[@"百度",@"新浪",@"腾讯",@"搜狐",@"智游集团",@"爱奇艺"];
    
    _urlArray = @[@"http://www.baidu.com",
                  @"http://www.sina.com.cn",
                  @"http://www.qq.com",
                  @"http://www.sohu.com",
                  @"http://www.zhiyou100.com",
                  @"http://www.iqiyi.com"];
    
    _buttonArray = [[NSMutableArray alloc] initWithCapacity:_buttonTitleArray.count];
    
    [self loadSubviews];
    
    [self webButtonClick:[_buttonArray objectAtIndex:0]];
}

- (void)loadSubviews{
    _redView = [[UIView alloc] initWithFrame:CGRectZero];
    _redView.backgroundColor = [UIColor redColor];
    [_scrollView addSubview:_redView];
    _scrollView.contentSize = CGSizeMake(80*_buttonTitleArray.count, 30);
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0; i<_buttonTitleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(i*80, 0, 80, 30);
        [button setTitle:[_buttonTitleArray objectAtIndex:i] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(webButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonArray addObject:button];
        [_scrollView addSubview:button];
    }
    
    [self locateRedView];
}

- (void)locateRedView{
    NSString *title = [_buttonTitleArray objectAtIndex:_currentSelectedButton];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    _redView.frame = CGRectMake(0, 0, size.width, 2);
    UIButton *button = [_buttonArray objectAtIndex:_currentSelectedButton];
    _redView.center = CGPointMake(button.center.x, 29);
    
}


- (void)webButtonClick:(UIButton *)sender{
    _currentSelectedButton = sender.tag;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [self locateRedView];
    [UIView commitAnimations];
    
    NSString *urlString = [_urlArray objectAtIndex:sender.tag];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [_webView loadRequest:request];
}


- (IBAction)backButtonClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



@end







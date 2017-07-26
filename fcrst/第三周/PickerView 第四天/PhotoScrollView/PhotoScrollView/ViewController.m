//
//  ViewController.m
//  PhotoScrollView
//
//  Created by sunhuayu on 15/7/30.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*5, _scrollView.frame.size.height);
    
    [self.view addSubview:_scrollView];
    
    _scrollView.pagingEnabled = YES;
    
    
    for (int i = 0; i<5; i++) {
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(i*_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        
        [_scrollView addSubview:scroll];
        
        scroll.delegate = self;
        scroll.maximumZoomScale = 2;
        scroll.minimumZoomScale = 0.5;
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:scroll.bounds];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        
        imgView.tag = 100;
        
        [scroll addSubview:imgView];
    }
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return [scrollView viewWithTag:100];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

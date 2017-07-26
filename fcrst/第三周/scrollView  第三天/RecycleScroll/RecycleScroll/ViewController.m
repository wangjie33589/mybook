//
//  ViewController.m
//  RecycleScroll
//
//  Created by sunhuayu on 15/7/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //scrollView本身不能实现循环滑动。但是可以通过在最后添加一张与第一张一样的图片，实现一个循环滑动的假象。
    
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*6, _scrollView.frame.size.height);
    
    for (int i = 0; i<6; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width*i, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i%5+1]];
        [_scrollView addSubview:imgView];
    }
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.delegate = self;
    
}

- (IBAction)pageControlChange:(UIPageControl *)sender {
    [_scrollView setContentOffset:CGPointMake(sender.currentPage*_scrollView.frame.size.width, 0) animated:YES];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x/scrollView.frame.size.width;
    
    //每当scrollView滑动到最后一张时，瞬间把scrollView再切换到第一张(把offSet设置为0)。就能实现循环。
    if (page == 5) {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        page = 0;
    }
    
    _pageControl.currentPage = page ;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

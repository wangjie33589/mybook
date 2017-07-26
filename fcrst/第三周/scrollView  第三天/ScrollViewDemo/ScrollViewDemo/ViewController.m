//
//  ViewController.m
//  ScrollViewDemo
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
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, 320, 400)];
    
    [self.view addSubview:_scrollView];
    
    //frame表示view的坐标和大小。
    //scrollView的frame.size表示本身轮廓的大小。
    
    
    //contentSize表示内容的尺寸。
    //如果contentSize.width大于本身frame.size.width那么scrollView就可以左右滑动。
    //如果contentSize.height大于本身frame.size.height，那么scrollView就可以上下滑动。
    _scrollView.contentSize = CGSizeMake(320*5, 400);
    
//    _scrollView.maximumZoomScale = 2;
//    _scrollView.minimumZoomScale = 0.5;
    
    
    for (int i = 0; i<5; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i*320, 0, 320, 400)];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        imgView.tag = i+1;
        [_scrollView addSubview:imgView];
    }
    
    //打开自动分页功能。
    _scrollView.pagingEnabled = YES;
    
    //关闭反弹效果
    //_scrollView.bounces = NO;
    
    //是否显示水平滚动条。
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    //是否显示垂直滚动条。
    //_scrollView.showsVerticalScrollIndicator
    
    
    
    //设置scrollView的delegate为self。那么scrollView就会调用self中的协议方法。
    _scrollView.delegate = self;
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(60, 440, 200, 20)];
    
    [_pageControl addTarget:self action:@selector(pageControlChange:) forControlEvents:UIControlEventValueChanged];
    
    
    //设置页数。
    _pageControl.numberOfPages = 5;
    
    //设置小点的颜色
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    
    //设置被选中的点的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
    [self.view addSubview:_pageControl];
    
    
    //[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
}

- (void)timerMethod{
    _currentPage++;
    
    if (_currentPage>=5) {
        _currentPage = 0;
    }
    
    [_scrollView setContentOffset:CGPointMake(_currentPage*320, 0) animated:YES];
    
    _pageControl.currentPage = _currentPage;
}

//当scrollView结束减速(分页完成)时调用。
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //NSLog(@"分页完成了");
    
    //scrollView.contentOffset 表示scrollView当前的偏移量。
    //用scrollView的x坐标偏移量除以scrollView的宽度就是当前显示的页数。
    int page = scrollView.contentOffset.x/320;
    _pageControl.currentPage = page;
    
    
}

- (void)pageControlChange:(UIPageControl *)sender{
    //错误方法，不能这样写。
    //_scrollView.contentOffset.x = sender.currentPage*320;
    
    //根据页数计算偏移量。
    
    //_scrollView.contentOffset = CGPointMake(sender.currentPage*320, 0);
    
    //带动画改变偏移量
    [_scrollView setContentOffset:CGPointMake(sender.currentPage*320, 0) animated:YES];
    
}


//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
//    return [scrollView viewWithTag:1];
//}


//当scrollView滑动时调用。
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"滑动了");
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

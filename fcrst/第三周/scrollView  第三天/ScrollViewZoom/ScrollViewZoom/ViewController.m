//
//  ViewController.m
//  ScrollViewZoom
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
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_scrollView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:_scrollView.bounds];
    
    imgView.tag = 5;
    
    imgView.image = [UIImage imageNamed:@"2.jpg"];
    
    [_scrollView addSubview:imgView];
    
    
    //要实现scrollView上内容的缩放，第一步，设置代理
    _scrollView.delegate = self;
    
    //设置scrollView的最大放大比例。
    _scrollView.maximumZoomScale = 2;
    
    //设置scrollView的最小缩小比例。
    _scrollView.minimumZoomScale = 0.5;
    
    
    //*contentInset scrollView的内容部分距离上下左右四个边界的尺寸。
    //_scrollView.contentInset = UIEdgeInsetsMake(30, 30, 30, 30);
    
    
    
}

//缩放第二步，实现viewForZooming协议方法，并在方法中返回需要进行缩放的视图。（这个视图必须是scrollView的子视图）
//如果用一个scrollView进行图片的缩放，那么最好不要再用它进行滑动。
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return [scrollView viewWithTag:5];
}


//当scrollView进行缩放时调用。
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
    //UIImageView *imgView = (UIImageView *)[scrollView viewWithTag:5];
    //NSLog(@"%@",NSStringFromCGRect(imgView.frame));
    if (scrollView.zoomScale<=1) {
        scrollView.contentInset = UIEdgeInsetsMake((1-scrollView.zoomScale)*568/2, (1-scrollView.zoomScale)*320/2, 0, 0);
    }else{
        scrollView.contentInset = UIEdgeInsetsMake(0,0,0,0);
    }
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end








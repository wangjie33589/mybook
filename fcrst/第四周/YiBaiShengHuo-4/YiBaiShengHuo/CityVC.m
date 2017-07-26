//
//  CityVC.m
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/5.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//


#import "CityVC.h"

@interface CityVC ()

@end

@implementation CityVC


#pragma mark- initSubview;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _buttonArray = [[NSMutableArray alloc] initWithCapacity:4];
    
    [self loadSubView];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    
    //[self loadItems];
    [self loadButtons];
}

- (void)loadSubView{
    UIImageView *navView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    navView.image = [UIImage imageNamed:@"c_bg.png"];
    navView.userInteractionEnabled = YES;
    [self.view addSubview:navView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [backButton setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(10, 7, 30, 30);
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:backButton];
    
    _verticalScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, 320, 436)];
    
    [self.view addSubview:_verticalScrollView];
    
    //_verticalScrollView.delaysContentTouches = NO;
    
    _horizontalScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    
    [_verticalScrollView addSubview:_horizontalScroll];
    
    _horizontalScroll.contentSize = CGSizeMake(320*6, 200);
    
    _horizontalScroll.pagingEnabled = YES;
    _horizontalScroll.delegate = self;
    
    
    for (int i = 0; i<6; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i*320, 0, 320, 200)];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"c_item%d.jpg",i%5]];
        [_horizontalScroll addSubview:imgView];
    }
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 180, 320, 20)];
    
    [_verticalScrollView addSubview:_pageControl];
    
    _pageControl.numberOfPages = 5;
    
    [_pageControl addTarget:self action:@selector(pageControlChange:) forControlEvents:UIControlEventValueChanged];
}


- (void)loadItems:(int)itemNumber{
    
    //每次添加新的按钮之前，先删除上次添加的按钮
    for (UIView *view in [_verticalScrollView subviews]) {
        
        //判断一个对象是否属于某个类。
        //[view isMemberOfClass:]
        
        //isKindOfClass  判断一个对象是否属于某个类或它的子类。
        
        if ([view isKindOfClass:[UIButton class]]) {
            [view removeFromSuperview];
        }
        
        
    }
    
    for (int i = 0; i<itemNumber; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(20+i%3*(20+80), 220+i/3*(20+80), 80, 80);
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"c_%d.png",i%12+1]] forState:UIControlStateNormal];
        [_verticalScrollView addSubview:button];
    }
    
    if (itemNumber%3 == 0) {
        _verticalScrollView.contentSize = CGSizeMake(320, 200+itemNumber/3*100+20);
    }else{
        _verticalScrollView.contentSize = CGSizeMake(320, 200+(itemNumber/3+1)*100+20);
    }
}

- (void)loadButtons{
    for (int i = 3; i>=0; i--) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(260, 420, 40, 40);
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"c_setting%d.png",i]] forState:UIControlStateNormal];
        button.tag = 3-i;
        [_buttonArray addObject:button];
        [button addTarget:self action:@selector(setButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

#pragma mark- timer

- (void)timerMethod{
    
    _page++;
    
    if (_page>5) {
        _page = 1;
    }
    
    _pageControl.currentPage = _page;
    
    [_horizontalScroll setContentOffset:CGPointMake(_page*320, 0) animated:YES];
    
    
}

#pragma mark- scrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x/320 == 5) {
        [scrollView setContentOffset:CGPointMake(0, 0)];
        _pageControl.currentPage = 0;
    }else{
        _pageControl.currentPage = scrollView.contentOffset.x/320;
    }
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x/320 == 5) {
        [scrollView setContentOffset:CGPointMake(0, 0)];
        _pageControl.currentPage = 0;
    }
}



#pragma mark- pageControl

- (void)pageControlChange:(UIPageControl *)sender{
    [_horizontalScroll setContentOffset:CGPointMake(sender.currentPage*320, 0) animated:YES];
}


#pragma mark- button
- (void)backButtonClick:(UIButton *)sender{
    [_timer invalidate];
    _timer = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setButtonClick:(UIButton *)sender{
    if (!_isOpen) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(openAnimationFinish)];
        for (int i = 0; i<4; i++) {
            UIButton *button = [_buttonArray objectAtIndex:i];
            button.frame = CGRectMake(200+i%2*(40+20), 360+i/2*(40+20), 40, 40);
        }
        
        [UIView commitAnimations];
        
        _isOpen = YES;
    }else{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(closeAnimationFinish)];
        for (int i = 0; i<4; i++) {
            UIButton *button = [_buttonArray objectAtIndex:i];
            button.frame = CGRectMake(200+i%2*(40+20), 360+i/2*(40+20), 40, 40);
        }
        
        [UIView commitAnimations];
        _isOpen = NO;
    }
    
    switch (sender.tag) {
        case 0:
            //酒店
            [self loadItems:10];
            break;
        case 1:
            //美食
            [self loadItems:20];
            break;
        case 2:
            //交通
            [self loadItems:30];
            break;
            
        default:
            break;
    }
    
}

#pragma mark- animation

- (void)openAnimationFinish{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    for (int i = 0; i<4; i++) {
        UIButton *button = [_buttonArray objectAtIndex:i];
        button.frame = CGRectMake(210+i%2*(40+10), 370+i/2*(40+10), 40, 40);
    }
    [UIView commitAnimations];
}

- (void)closeAnimationFinish{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    for (int i = 0; i<4; i++) {
        UIButton *button = [_buttonArray objectAtIndex:i];
        button.frame = CGRectMake(260, 420, 40, 40);
    }
    [UIView commitAnimations];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

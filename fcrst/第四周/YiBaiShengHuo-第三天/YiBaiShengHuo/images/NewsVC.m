//
//  NewsVC.m
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/4.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "NewsVC.h"

@interface NewsVC ()

@end

@implementation NewsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = @[@"头条",@"娱乐",@"体育",@"科技",@"财经",@"时尚"];
    [self loadBackgroundView];
    [self loadFrontView];
    
    
}

- (void)loadBackgroundView{
    //背景图片
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.image = [UIImage imageNamed:@"n_background.png"];
    [self.view addSubview:backgroundView];
    
    //返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(10, 440, 30, 30);
    [backButton setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(gobackButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    //创建半透明的覆盖层
    _coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, 320, 65)];
    _coverView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.5];
    [self.view addSubview:_coverView];
    
    //6个button
    for (int i = 0; i<6; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, 40+i*65, 320, 65);
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
}

- (void)loadFrontView{
    _frontView = [[UIView alloc] initWithFrame:self.view.bounds];
    _frontView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_frontView];
    
    UIView *navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    //autoresizingMask表示该视图是否随着父视图一起变大变小。
    navBar.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin;
    
    
    [_frontView addSubview:navBar];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:navBar.bounds];
    imgView.image = [UIImage imageNamed:@"commonNavBar.png"];
    imgView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin;
    [navBar addSubview:imgView];
    
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    menuButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin;
    
    menuButton.frame = CGRectMake(5, 7, 30, 30);
    [menuButton setBackgroundImage:[UIImage imageNamed:@"n_menu"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(menuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:menuButton];
    
    _titleLabel = [[UILabel alloc] initWithFrame:navBar.bounds];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = [_titleArray firstObject];
    _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin;
    [navBar addSubview:_titleLabel];
}

- (void)menuButtonClick:(UIButton *)sender{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    //_frontView.frame = CGRectMake(160, 120, 160, 240);
    
    CGAffineTransform transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0.5,0.5),CGAffineTransformMakeTranslation(100,0));
    
    _frontView.transform = transform;
    
    [UIView commitAnimations];
    
    
}

- (void)buttonClick:(UIButton *)sender{
    NSLog(@"%d",sender.tag);
    
    _titleLabel.text = [_titleArray objectAtIndex:sender.tag];
    
    if (sender.tag%2 == 0) {
        _frontView.backgroundColor = [UIColor orangeColor];
    }else{
        _frontView.backgroundColor = [UIColor greenColor];
    }
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    _coverView.frame = sender.frame;
    //_frontView.frame = self.view.bounds;
    _frontView.transform = CGAffineTransformIdentity;
    
    [UIView commitAnimations];
}

- (void)gobackButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

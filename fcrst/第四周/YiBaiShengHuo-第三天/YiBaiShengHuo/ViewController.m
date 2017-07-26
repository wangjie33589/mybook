//
//  ViewController.m
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/3.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "MainVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSubview];
}

//加载子视图
- (void)loadSubview{
    _imageViewArray = [[NSMutableArray alloc] initWithCapacity:4];
    
    //创建一个数字数组，用于生成4个不重复的随机数。
    NSMutableArray *numArray = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i<10; i++) {
        NSString *number = [NSString stringWithFormat:@"%d",i];
        [numArray addObject:number];
    }
    
    //创建4个imageView
    for (int i = 0; i<4; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(24+i%4*(50+24), 100, 50, 50)];
        
        int index = arc4random()%numArray.count;
        NSString *number = [numArray objectAtIndex:index];
        
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"b_%@.png",number]];
        
        [numArray removeObjectAtIndex:index];
        
        imgView.tag = number.integerValue;
        
        [self.view addSubview:imgView];
        [_imageViewArray addObject:imgView];
    }
    
    
    //创建10个button
    for (int i = 0; i<10; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(20+i%5*(40+20), 280+i/5*(40+20), 40, 40);
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"s_%d",i]] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(numberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
}

- (void)numberButtonClick:(UIButton *)sender{
    if (sender.frame.size.width<=40) {
        //往上飞
        int place = [self findEmptyPlace];
        
        if (place == NSNotFound) {
            return;
        }
        _hasButton[place] = YES;
        
        sender.enabled = NO;
        
        [UIView beginAnimations:nil context:(__bridge void *)(sender)];
        [UIView setAnimationDuration:1];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
        
        sender.frame = CGRectMake(24+place*(50+24), 100, 50, 50);
        
        [UIView commitAnimations];
    }else{
        //往下飞
        
        //按钮下去后，这个位置的imageView上就又没有按钮了
        int place = (sender.frame.origin.x-24)/74;
        _hasButton[place] = NO;
        
        //如果把正确的button点掉，那么当前正确的数量-1
        UIImageView *imgView = [_imageViewArray objectAtIndex:place];
        if (sender.tag == imgView.tag) {
            _correctNumber--;
        }
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
        sender.frame = CGRectMake(20+sender.tag%5*(20+40), 280+sender.tag/5*(20+40), 40, 40);
        [UIView commitAnimations];
    }
    
    
    
    
}

//从左往右找到一个没有按钮的图片位置。
- (int)findEmptyPlace{
    for (int i = 0; i<4; i++) {
        if (_hasButton[i] == NO) {
            return i;
        }
    }
    
    return NSNotFound;
    
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    UIButton *sender = (__bridge UIButton *)context;
    
    int place = (sender.frame.origin.x-24)/74;
    
    UIImageView *imgView = [_imageViewArray objectAtIndex:place];
    
    if (sender.tag == imgView.tag) {
        //如果上去的button和对应位置的imageView数字一样，那么正确的数量+1
        _correctNumber++;
        
        //当4个数字都正确时，执行翻页。
        if (_correctNumber>=1) {
            NSLog(@"翻页");
            
            UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
            MainVC *vc = [[MainVC alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            nav.navigationBarHidden = YES;
            
            window.rootViewController = nav;
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1];
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:window cache:YES];
            [UIView commitAnimations];
        }
    }
    
    sender.enabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end














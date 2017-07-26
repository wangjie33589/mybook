//
//  WeatherVC.m
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/7.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "WeatherVC.h"


@interface WeatherVC ()

@end

@implementation WeatherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _buttonArray = [[NSMutableArray alloc] initWithCapacity:7];
    // Do any additional setup after loading the view from its nib.
    [self loadWeekdayButtons];
    
    
    _tipView = [[UIImageView alloc] initWithFrame:CGRectMake(-50, -50, 80, 10)];
    _tipView.image = [UIImage imageNamed:@"w_tip.png"];
    [_scrollView addSubview:_tipView];
    
    [self weekdayButtonClick:[_buttonArray objectAtIndex:0]];
    
    _weatherImageView.clipsToBounds = YES;
}

- (void)loadWeekdayButtons{
    NSArray *buttonTitles = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    
    _scrollView.contentSize = CGSizeMake(20*8+80*7, 80);
    
    for (int i = 0; i<7; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:[buttonTitles objectAtIndex:i] forState:UIControlStateNormal];
        button.frame = CGRectMake(20+i*(20+80), 10, 80, 60);
        [button addTarget:self action:@selector(weekdayButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:@"w_xq2.png"] forState:UIControlStateNormal];
        button.tag = i;
        [_scrollView addSubview:button];
        [_buttonArray addObject:button];
    }
}


- (IBAction)backButtonClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)dayAndNightClick:(UIButton *)sender {
    _isNight = !_isNight;
    
    if (_isNight) {
        [sender setTitle:@"晚上" forState:UIControlStateNormal];
    }else{
        [sender setTitle:@"白天" forState:UIControlStateNormal];
    }
    
    [self resetWeatherView];
}

- (void)weekdayButtonClick:(UIButton *)sender{
    UIButton *previousButton = [_buttonArray objectAtIndex:_selectedButtonIndex];
    
    [previousButton setBackgroundImage:[UIImage imageNamed:@"w_xq2.png"] forState:UIControlStateNormal];
    
    _selectedButtonIndex = sender.tag;
    
    [sender setBackgroundImage:[UIImage imageNamed:@"w_xq1.png"] forState:UIControlStateNormal];
    
    _tipView.center = CGPointMake(sender.center.x, sender.center.y-35);
    
    [self resetWeatherView];
}

//重置天气视图.
- (void)resetWeatherView{
    //先删除上次的图片
    for (UIView *view in [_weatherImageView subviews]) {
        [view removeFromSuperview];
    }
    
    switch (_selectedButtonIndex) {
        case 0:
        case 1:{
            //晴天
            if (_isNight) {
                //懒加载
                if (!_night) {
                    _night = [[NightView alloc] initWithFrame:_weatherImageView.bounds];
                }
                [_weatherImageView addSubview:_night];
            }else{
                if (!_sun) {
                    _sun = [[SunnyView alloc] initWithFrame:_weatherImageView.bounds];
                }
                
                [_weatherImageView addSubview:_sun];
            }
        }
            break;
        case 2:{
            //多云
            if (_isNight) {
                if (!_night) {
                    _night = [[NightView alloc] initWithFrame:_weatherImageView.bounds];
                }
                [_weatherImageView addSubview:_night];
            }else{
                UIImageView *duoyun = [[UIImageView alloc] initWithFrame:_weatherImageView.bounds];
                duoyun.image = [UIImage imageNamed:@"w_duoyun.png"];
                [_weatherImageView addSubview:duoyun];
            }
            if (!_cloud) {
                _cloud = [[CloudView alloc] initWithFrame:_weatherImageView.bounds];
            }
            [_weatherImageView addSubview:_cloud];
            break;
        }
            
        case 3:{
            //下雨
            if (_isNight) {
                UIImageView *imgView = [[UIImageView alloc] initWithFrame:_weatherImageView.bounds];
                imgView.image = [UIImage imageNamed:@"w_night"];
                [_weatherImageView addSubview:imgView];
            }else{
                UIImageView *imgView = [[UIImageView alloc] initWithFrame:_weatherImageView.bounds];
                imgView.image = [UIImage imageNamed:@"w_yu.png"];
                [_weatherImageView addSubview:imgView];
            }
            
            if (!_rain) {
                _rain = [[RainView alloc] initWithFrame:_weatherImageView.bounds];
            }
            [_weatherImageView addSubview:_rain];
        }
            break;
        case 4:{
            //阴天
            if (_isNight) {
                UIImageView *imgView = [[UIImageView alloc] initWithFrame:_weatherImageView.bounds];
                imgView.image = [UIImage imageNamed:@"w_night"];
                [_weatherImageView addSubview:imgView];
            }else{
                UIImageView *imgView = [[UIImageView alloc] initWithFrame:_weatherImageView.bounds];
                imgView.image = [UIImage imageNamed:@"w_yin"];
                [_weatherImageView addSubview:imgView];
            }
        }
            
            break;
        case 5:
        case 6:{
            if (_isNight) {
                if (!_night) {
                    _night = [[NightView alloc] initWithFrame:_weatherImageView.bounds];
                }
                [_weatherImageView addSubview:_night];
            }else{
                UIImageView *imgView = [[UIImageView alloc] initWithFrame:_weatherImageView.bounds];
                imgView.image = [UIImage imageNamed:@"w_yin"];
                [_weatherImageView addSubview:imgView];
                if (!_rain) {
                    _rain = [[RainView alloc] initWithFrame:_weatherImageView.bounds];
                }
                [_weatherImageView addSubview:_rain];
            }
        }
            
            break;

            
        default:
            break;
    }
    
}


@end











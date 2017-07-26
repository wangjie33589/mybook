//
//  MainVC.m
//  YiBaiShengHuo
//
//  Created by sunhuayu on 15/8/3.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "MainVC.h"
#import "NewsVC.h"
#import "CityVC.h"
#import "SearchVC.h"
#import "WeatherVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _speed = 1;
    _buttonArray = [[NSMutableArray alloc] initWithCapacity:4];
    [self loadSubView];
}

- (void)loadSubView{
    for (int i = 0; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, 0, 50, 50);
        button.center = CGPointMake(160+cos(i*M_PI/2)*100, 250+sin(i*M_PI/2)*100);
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"m_item%d.png",i+1]] forState:UIControlStateNormal];
        [self.view addSubview:button];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonArray addObject:button];
    }
}

- (void)buttonClick:(UIButton *)sender{
    _targetAngle = (3-sender.tag)*90;
    
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    }
    
    
}

- (void)timerMethod{
    if (_targetAngle == _currentAngle) {
        //达到目标位置
        [_timer invalidate];
        _timer = nil;
        
        switch (_targetAngle) {
            case 0:{
                //新闻页
                NewsVC *vc = [[NewsVC alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 90:{
                //城市页
                CityVC *vc = [[CityVC alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 180:{
                //搜索页
                SearchVC *vc = [[SearchVC alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 270:{
                //天气页
                WeatherVC *vc = [[WeatherVC alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
                
                
            default:
                break;
        }
        
        
        
    }else{
        _currentAngle+=_speed;
        if (_currentAngle >= 360) {
            _currentAngle = 0;
        }
        
        for (int i = 0; i<4; i++) {
            UIButton *button = [_buttonArray objectAtIndex:i];
            button.center = CGPointMake(160+cos((_currentAngle+i*90)*M_PI/180)*100, 250+sin((_currentAngle+i*90)*M_PI/180)*100);
        }
        
    }
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

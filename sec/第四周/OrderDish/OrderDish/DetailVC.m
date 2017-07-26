//
//  DetailVC.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView.image = [UIImage imageNamed:_dish.picName];
    _nameLabel.text = _dish.name;
    
    _pricaLabel.text = [NSString stringWithFormat:@"%d元/%@",_dish.price,_dish.unit];
    
}

- (IBAction)gobackClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (void)dealloc {
    [_dish release];
    [_imageView release];
    [_nameLabel release];
    [_pricaLabel release];
    [super dealloc];
}
@end

//
//  RoomVC.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/30.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "RoomVC.h"
#import "SendOrderVC.h"

@interface RoomVC ()

@end

@implementation RoomVC

- (void)dealloc{
    [_array release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [[NSArray alloc] initWithObjects:@"文华轩",@"希尔顿",@"威斯汀",@"万丽", nil];
    
    
}

- (IBAction)roomButtonClick:(UIButton *)sender {
    NSString *room = [_array objectAtIndex:sender.tag];
    
    [_previousVC selectRoom:room];
    
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

@end

//
//  SendOrderVC.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/30.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "SendOrderVC.h"
#import "RoomVC.h"
#import "GroupRecordTableDAO.h"
#import "RecordTableDAO.h"
#import "OrderTableDAO.h"

@interface SendOrderVC ()

@end

@implementation SendOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)gobackClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)chooseRoomClick:(UIButton *)sender {
    RoomVC *vc = [[RoomVC alloc] init];
    
    vc.previousVC = self;
    
    [self presentViewController:vc animated:YES completion:nil];
    
    [vc release];
}

- (void)selectRoom:(NSString *)room{
    [_roomButton setTitle:room forState:UIControlStateNormal];
}



- (IBAction)sendOrderClick:(UIButton *)sender {
    if (_roomButton.currentTitle.length<=0) {
        return;
    }
    //生成一次就餐记录
    NSDate *date = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *dateString = [formatter stringFromDate:date];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *timeString = [formatter stringFromDate:date];
    [formatter release];
    
    //把已经点的菜存入历史菜单表
    
    int repastID = [GroupRecordTableDAO insetRepastRecordWithDate:dateString time:timeString room:_roomButton.currentTitle];
    
    [RecordTableDAO saveOrderedDishesIntoHistoryOrderWithRepastID:repastID];
    
    //清除所有已点的菜.
    [OrderTableDAO deleteAllDishes];
    
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
    [_roomButton release];
    [super dealloc];
}
@end

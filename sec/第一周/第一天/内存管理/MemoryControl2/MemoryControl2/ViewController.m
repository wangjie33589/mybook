//
//  ViewController.m
//  MemoryControl2
//
//  Created by sunhuayu on 15/8/10.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSObject *obj = [[NSObject alloc] init];
//    
//    NSLog(@"%u",obj.retainCount);
//    
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    
//    //把对象放入数组（字典）后，数组（字典）会对这个对象引用计数+1.
//    [array addObject:obj];
//    [array addObject:obj];
//    
//    [obj release];
//    
//    NSLog(@"%u",obj.retainCount);
//    
//    //当把对象从数组中移除时，引用计数会-1(减去数组对它的引用次数)
//    [array removeObject:obj];
//    
//    //当数组本身释放时，会对自身内部所有引用的对象引用计数-1.
//    [array release];
    
    
    
    /*--------------------------*/
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 40, 200, 30)];
    label.backgroundColor = [UIColor redColor];
    NSLog(@"%u",label.retainCount);
    
    //当把子视图添加到父视图上时，父视图会对子视图引用计数+1.
    [self.view addSubview:label];
    
    [label release];
    
    NSLog(@"%u",label.retainCount);
    
    //当把子视图从父视图移除时，子视图，引用计数-1.
    
    //当一个视图释放时，会对自身所有子视图引用计数-1.
    
}

- (IBAction)showAlertClick:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"标题" message:@"消息" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    
    NSLog(@"%u",alert.retainCount);
    
    //show会使alertView引用计数增加。
    [alert show];
    
    [alert release];
    
    NSLog(@"%u",alert.retainCount);
    
    //alertView消失时，引用计数会减少。
}


- (IBAction)gotoSecondVC:(UIButton *)sender {
    SecondVC *vc = [[SecondVC alloc] init];
    
    NSLog(@"%u",vc.retainCount);
    
    //push会导致vc引用计数增加。
    [self.navigationController pushViewController:vc animated:YES];
    
    [vc release];
    
    NSLog(@"%u",vc.retainCount);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end












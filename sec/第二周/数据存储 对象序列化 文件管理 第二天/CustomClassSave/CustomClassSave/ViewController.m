//
//  ViewController.m
//  CustomClassSave
//
//  Created by sunhuayu on 15/8/18.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
}

- (IBAction)savePeopleClick:(UIButton *)sender {
    People *p = [[People alloc] init];
    p.name = @"张三";
    p.age = 99;
    p.sex = YES;
    
    //只有数组存储的对象是系统的7大数据类(NSString,NSNumber,NSArray,NSDictionary,NSData,NSDate,NSSet)时，数组才可以writeToFile。
    
//    NSArray *array = @[p];
//    
//    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.txt"];
//    
//    if (![array writeToFile:path atomically:NO]) {
//        NSLog(@"存储失败");
//    }
    
    
    //userDefault中只能存储基本类型或7大数据类，不能存储自定义的类。
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:p forKey:@"people"];
    [user synchronize];
    
    
    
    //自定义类的对象要存入文件，必须先进行对象序列化(把对象转为二进制数据)
    
    //NSKeyedArchiver编码器，能够把一个对象编码为二进制数据(这个对象必须满足NSCoding协议)
    //NSData数据类，表示一段二进制数据
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:p];
    
    //数组中所有对象都满足NSCoding时，这个数组才可以序列化。
//    NSArray *arr = nil;
//    [NSKeyedArchiver archivedDataWithRootObject:arr];
    
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.plist"];
    
    [data writeToFile:path atomically:NO];
    
}

- (IBAction)readPeopleClick:(UIButton *)sender {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.plist"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    //NSKeyedUnarchiver解码器，能够把二进制数据解码为对象。
    People *p = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSLog(@"%@",p);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end













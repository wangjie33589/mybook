//
//  ViewController.m
//  DictionaryDemo
//
//  Created by sunhuayu on 15/7/30.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSDictionary,字典，字典中可以存放对象，对象在字典中以键值对的形式存在，没有顺序。
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"孙悟空",@"猴子",@"猪八戒",@"胖子", nil];
    
    //想要查找字典中的某个对象，必须知道它的键。
    
    //当查询一个不存在的键值对时，会返回空。
    NSString *str1 = [dic objectForKey:@"瞎子"];
    
    NSLog(@"%@",str1);
    
    //NSMutableDictionary可变字典。
    NSMutableDictionary *mDic = [[NSMutableDictionary alloc] init];
    
    //可变字典可以添加新的键值对
    [mDic setObject:@"唐僧" forKey:@"和尚"];
    
    //删除一个键值对
    [mDic removeObjectForKey:@"和尚"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end









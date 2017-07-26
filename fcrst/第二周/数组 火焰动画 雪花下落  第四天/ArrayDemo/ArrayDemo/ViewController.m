//
//  ViewController.m
//  ArrayDemo
//
//  Created by 孙 化育 on 15-7-23.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        //获得数组中的某个数据
//    _cArray[0] = 3;
//    _cArray[3] = 10;
//    for (int i = 0; i<10; i++) {
//        NSLog(@"%d",_cArray[i]);
//    }
    
        //数组使用前要先创建，否则是个空指针。
        //OC的数组中只能存放对象，不能存放基本类型。
    NSString *str1 = @"sunhuayu";
    NSString *str2 = @"孙悟空";
    NSString *str3 = @"八戒";
    _array = [[NSArray alloc] initWithObjects:str1,str2,str3, nil];
    
        //initWithCapacity指定容量
    _mArray = [[NSMutableArray alloc] initWithCapacity:10];
    
        //往数组中添加一个对象，添加的对象会放在数组末尾。
    [_mArray addObject:str1];
    
        //往数组中某个索引值位置插入一个对象。
    [_mArray insertObject:str2 atIndex:0];
    
        //移除数组中某个索引值位置的对象。
    [_mArray removeObjectAtIndex:1];
    
        //删除数组中所有的对象。
    [_mArray removeAllObjects];
    
    for (int i = 0; i<10; i++) {
        [_mArray addObject:@"123"];
    }
    
    [_mArray addObject:@"aaa"];
    
    NSLog(@"%@",_mArray);
    
}

- (IBAction)buttonClick:(UIButton *)sender {
        //%@是对象的占位符。
        //NSLog(@"%@",_array);
    
        //objectAtIndex获取数组中某个索引值位置的对象。如果这个索引值不存在，那么就会造成数组越界，程序直接崩溃。
    NSString *s = [_array objectAtIndex:1];
    
        //获取数组中最前面的对象。
        //NSString *s = [_array firstObject];
        //最后一个对象。
        //NSString *s = [_array lastObject];
    
        //NSString *s = _array[0];
    
        //_array.count表示数组中对象的个数
//    for (int i = 0; i<_array.count; i++) {
//        NSLog(@"%@",[_array objectAtIndex:i]);
//    }
    
    for (NSString *s in _array) {
        NSLog(@"%@",s);
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

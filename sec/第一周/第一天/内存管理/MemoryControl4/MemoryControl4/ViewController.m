//
//  ViewController.m
//  MemoryControl4
//
//  Created by sunhuayu on 15/8/10.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc{
    [_obj release];
    //[self setObj:nil];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSObject *o1 = [[NSObject alloc] init];
    
    [self setObj:o1];
    
//    NSObject *o2 = [[NSObject alloc] init];
//    
//    [self setObj:o2];
    
    [o1 release];
    //[o2 release];
    
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectZero];
    NSLog(@"%u",lab.retainCount);
    self.label = lab;
    
    NSLog(@"%u",lab.retainCount);
    
    self.label = nil;
    NSLog(@"%u",lab.retainCount);
    
}

//*对象的set方法(打点调用赋值)，会先对之前指向的对象release一次，然后对新指向的对象retain一次。
- (void)setObj:(NSObject *)obj{
    if (_obj != obj) {
        [_obj release];
        _obj = [obj retain];
    }
}

- (NSObject *)obj{
    return _obj;
}





- (IBAction)buttonClick:(UIButton *)sender {
    NSLog(@"%@",_obj);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

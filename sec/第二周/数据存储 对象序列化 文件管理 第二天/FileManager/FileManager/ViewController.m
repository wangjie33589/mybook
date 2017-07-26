//
//  ViewController.m
//  FileManager
//
//  Created by sunhuayu on 15/8/18.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

#define FILE_M [NSFileManager defaultManager]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
    
}

- (IBAction)createFileClick:(UIButton *)sender {
    //NSFileManager文件管理器，是单例类，可以实现对文件的删除，复制，粘贴等操作。
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/file.txt"];
    
    //把字符串转换为NSData
    NSData *data = [@"一二三四五六七" dataUsingEncoding:NSUTF8StringEncoding];
    
    //创建一个文件，第一个参数时文件的路径，第二个参数时文件的内容，第三个参数时文件的属性(不需要设置)
    [manager createFileAtPath:path contents:data attributes:nil];
    
}

- (IBAction)createDirectory:(UIButton *)sender {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/abc/123"];
    
    NSError *err = nil;
    //创建一个文件夹，第一个参数表示创建的文件夹的路径，第二个参数表示是否自动创建路径中不存在的中间文件夹，第三个参数是文件夹的属性，第四个参数是如果创建失败，失败的原因。
    if (![FILE_M createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&err]) {
        NSLog(@"%@",err);
    }
    
    
}

- (IBAction)copyFileClick:(UIButton *)sender {
    NSString *atPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/file.txt"];
    NSString *toPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/abc/copyFile.txt"];
    NSError *err = nil;
    //copyItemAtPath复制粘贴一个文件或文件夹，第一个参数是要复制的文件路径，第二个参数是粘贴位置的路径，第三个参数是失败原因。
    if (![FILE_M copyItemAtPath:atPath toPath:toPath error:&err]) {
        NSLog(@"%@",err);
    }
}

- (IBAction)moveFileClick:(UIButton *)sender {
    //剪切
    //[FILE_M moveItemAtPath: toPath: error:]
}


- (IBAction)deleteFileClick:(UIButton *)sender {
    //删除一个文件或文件夹，第一个参数要删除的文件的路径。
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/abc"];
    [FILE_M removeItemAtPath:path error:nil];
}

- (IBAction)isFileExist:(UIButton *)sender {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/abc"];
    
    BOOL isDir;
    
    //判断某个文件是否存在，第一个参数是要判断的路径，第二个参数是目标位置时是文件还是文件夹
    if ([FILE_M fileExistsAtPath:path isDirectory:&isDir]) {
        NSLog(@"存在");
        if (isDir) {
            NSLog(@"是文件夹");
        }else{
            NSLog(@"是文件");
        }
    }else{
        NSLog(@"不存在");
    }
    
}

- (IBAction)fileAttributes:(UIButton *)sender {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/file.txt"];
    //获取某个文件或文件夹的属性。
    NSDictionary *dic = [FILE_M attributesOfItemAtPath:path error:nil];
    
    NSLog(@"%llu",[dic fileSize]);
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end












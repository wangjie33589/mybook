//
//  ViewController.m
//  DataSave
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

- (IBAction)saveStringClick:(UIButton *)sender {
    NSString *text = [NSString stringWithFormat:@"%@|%@|%d",_nameField.text,_ageField.text,_sexControl.selectedSegmentIndex];
    
    //IOS系统中，每一个APP都有一个独立的沙盒，APP对硬盘的访问权限仅限于自己沙盒内部。
    
    //NSHomeDirectory()获得本引用的沙盒路径。
    
    //沙盒下有4个文件夹。
    //Documents文件夹。存储用户数据和用户文档。
    //Library文件夹。存储系统数据。
    //tmp文件夹。临时文件夹，用于存储临时数据，这个文件夹不稳定，数据可能被清除。
    //.app文件夹，工程文件夹，这个文件夹是只读的。其中存储了工程中所有的资源文件（图片,xib文件）
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/myFile.txt"];
    
    //NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/myFile.txt"];
    
    NSError *err = nil;
    
    //writeToFile把字符串存入文件。第一个参数表示存储的路径(包含文件名),第二个参数表示是否原子性写入(如果多个线程可能同时操作这个文件，原子性需要写YES)，第三个参数表示文本的编码方式(字符串存储到硬盘上必须先转换为二进制数据，选择按照哪种编码格式进行编码)。第四个参数表示如果存储失败，失败的原因。
    if (![text writeToFile:path atomically:NO encoding:NSUTF8StringEncoding error:&err]) {
        NSLog(@"%@",err);
    }
}

- (IBAction)readStringClick:(UIButton *)sender {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/myFile.txt"];
    
    //从文件中读取字符串,第一个参数，读取的文件的路径，第二个参数编码方式，第三个参数，如果失败，失败的原因。
    NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@",text);
    
    //按照某个字符分割字符串，分割之后的所有字符串存放在一个数组中返回.
    NSArray *array = [text componentsSeparatedByString:@"|"];
    _nameField.text = [array objectAtIndex:0];
    _ageField.text = [array objectAtIndex:1];
    _sexControl.selectedSegmentIndex = [[array objectAtIndex:2] integerValue];
    
}

- (IBAction)saveArrayClick:(UIButton *)sender {
    //NSNumber *num = @5.5;
    NSNumber *number = [NSNumber numberWithInt:_sexControl.selectedSegmentIndex];
    
    NSArray *array = @[_nameField.text,_ageField.text,number];
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.txt"];
    
    //把数组存入文件
    [array writeToFile:path atomically:NO];
    
    
    //NSDictionary *dic = nil;
    //字典也可以直接存入文件
    //[dic writeToFile: atomically:];
}

- (IBAction)readArrayClick:(UIButton *)sender {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.txt"];
    //从文件中读取数组
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    _nameField.text = [array objectAtIndex:0];
    _ageField.text = [array objectAtIndex:1];
    _sexControl.selectedSegmentIndex = [[array objectAtIndex:2] integerValue];
    
    
}

- (IBAction)userDefaultSave:(UIButton *)sender {
    //用户数据类，是一个单例类，可以存储对象和基本类型。
    //userDefault中一般存储用户信息的相关数据。
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    [user setObject:_nameField.text forKey:@"name"];
    [user setObject:_ageField.text forKey:@"age"];
    
    [user setInteger:_sexControl.selectedSegmentIndex forKey:@"sex"];
    
    //[user removeObjectForKey:];
    
    //userDefault修改数据之后，需要立刻同步。
    [user synchronize];
}

- (IBAction)userDefaultReadClick:(UIButton *)sender {
    //从userDefault中读取数据
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    _nameField.text = [user objectForKey:@"name"];
    _ageField.text = [user objectForKey:@"age"];
    _sexControl.selectedSegmentIndex = [user integerForKey:@"sex"];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_nameField release];
    [_ageField release];
    [_sexControl release];
    [super dealloc];
}
@end

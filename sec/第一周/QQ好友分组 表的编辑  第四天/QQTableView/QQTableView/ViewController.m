//
//  ViewController.m
//  QQTableView
//
//  Created by sunhuayu on 15/8/13.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *friend = @[@"小明",@"baby",@"宝强"];
    
    NSArray *classmate = @[@"韩梅梅",@"李磊",@"lucy",@"林涛"];
    
    NSArray *family = @[@"爸爸",@"妈妈"];
    
    _sectionTitleArray = [[NSArray alloc] initWithObjects:@"朋友",@"同学",@"家人", nil];
    
    _friendArray = [[NSArray alloc] initWithObjects:friend,classmate,family, nil];
    
    //创建BOOL数组
    _isOpen = malloc(sizeof(BOOL)*_friendArray.count);
    
    //初始化BOOL数组。
    memset(_isOpen, 0, sizeof(BOOL)*_friendArray.count);
    
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //_tableView.sectionHeaderHeight = 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}



//这个方法只能够设置区头标题。
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return [_sectionTitleArray objectAtIndex:section];
//}


//自定义区头。
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitle:[_sectionTitleArray objectAtIndex:section] forState:UIControlStateNormal];
    
    button.backgroundColor = [UIColor greenColor];
    
    button.tag = section;
    
    [button addTarget:self action:@selector(headerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (void)headerButtonClick:(UIButton *)sender{
    _isOpen[sender.tag] = !_isOpen[sender.tag];
    
    //reloadData重新加载tableView。
    //[_tableView reloadData];
    
    //NSIndexSet索引集。
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:sender.tag];
    
    //动画刷新某些区。
    [_tableView reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _friendArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //根据区号从大数组中找到对应这个区的小数组，小数组中好友的个数就是这个区的行数。
    
    //先判断这个区当前时打开还是关闭，如果是打开，就返回这个区的行数，如果是关闭，就返回0.
    if (_isOpen[section]) {
        return [[_friendArray objectAtIndex:section] count];
    }else{
        return 0;
    }
    
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
    }
    
    cell.textLabel.text = [[_friendArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_sectionTitleArray release];
    [_friendArray release];
    [_tableView release];
    [super dealloc];
}
@end

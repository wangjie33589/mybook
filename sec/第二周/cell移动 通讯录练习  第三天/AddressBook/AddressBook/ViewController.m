//
//  ViewController.m
//  AddressBook
//
//  Created by sunhuayu on 15/8/19.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "People.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i<3; i++) {
        _isOpen[i] = YES;
    }
    
    _sectionTitleArray = [[NSArray alloc] initWithObjects:@"朋友",@"家人",@"同学", nil];
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.plist"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    _array = [[NSKeyedUnarchiver unarchiveObjectWithData:data] retain];
    if (!_array) {
        _array = [[NSMutableArray alloc] initWithCapacity:3];
        for (int i = 0; i<3; i++) {
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            [_array addObject:arr];
            [arr release];
        }
    }
    
    
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

#pragma mark- dataSave

- (void)saveData{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_array];
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.plist"];
    [data writeToFile:path atomically:NO];
}
#pragma mark- tableView
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isOpen[section]) {
        return [[_array objectAtIndex:section] count];
    }else{
        return 0;
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"] autorelease];
    }
    
    People *p = [[_array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = p.phoneNumber;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [[_array objectAtIndex:indexPath.section] removeObjectAtIndex:indexPath.row];
    [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self saveData];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc] initWithFrame:CGRectZero];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 290, 30);
    [button setTitle:[_sectionTitleArray objectAtIndex:section] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.tag = section;
    [button addTarget:self action:@selector(headerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [header addSubview:button];
    
    UIButton *addbutton = [UIButton buttonWithType:UIButtonTypeSystem];
    addbutton.frame = CGRectMake(290, 0, 30, 30);
    [addbutton setTitle:@"+" forState:UIControlStateNormal];
    addbutton.tag = section;
    addbutton.backgroundColor = [UIColor yellowColor];
    [addbutton addTarget:self action:@selector(footerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [header addSubview:addbutton];
    
    return [header autorelease];
    
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    People *p = [[_array objectAtIndex:sourceIndexPath.section] objectAtIndex:sourceIndexPath.row];
    //为了防止people对象从数组中移除时被释放，在移除之前先retain一次。从新加入数组之后再release一次。
    [p retain];
    [[_array objectAtIndex:sourceIndexPath.section] removeObjectAtIndex:sourceIndexPath.row];
    [[_array objectAtIndex:destinationIndexPath.section] insertObject:p atIndex:destinationIndexPath.row];
    [p release];
    
    [self saveData];
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    
    if (_isOpen[proposedDestinationIndexPath.section] == NO) {
        return sourceIndexPath;
    }
    
    return proposedDestinationIndexPath;
    
}


#pragma mark- button
- (void)headerButtonClick:(UIButton *)sender{
    
    _isOpen[sender.tag] = !_isOpen[sender.tag];
    
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationNone];
}


- (void)footerButtonClick:(UIButton *)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"添加联系人" message:@"请输入联系人的姓名和电话" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    //设置alertView上的输入框样式，默认为没有。
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
    //textFieldAtIndex获得alertView上的输入框
    UITextField *tf1 = [alert textFieldAtIndex:0];
    tf1.placeholder = @"姓名";
    
    UITextField *tf2 = [alert textFieldAtIndex:1];
    tf2.placeholder = @"电话号码";
    tf2.secureTextEntry = NO;
    
    alert.tag = sender.tag;
    
    [alert show];
    [alert release];
}

- (IBAction)editButtonClick:(UIButton *)sender {
    [_tableView setEditing:!_tableView.editing animated:YES];
}


#pragma mark- alertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        People *p = [[People alloc] init];
        p.name = [alertView textFieldAtIndex:0].text;
        p.phoneNumber = [alertView textFieldAtIndex:1].text;
        [[_array objectAtIndex:alertView.tag] addObject:p];
        [p release];
        [self saveData];
        [_tableView reloadData];
        
        _isOpen[alertView.tag] = YES;
        [_tableView reloadSections:[NSIndexSet indexSetWithIndex:alertView.tag] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)dealloc {
    [_sectionTitleArray release];
    [_array release];
    [_tableView release];
    [super dealloc];
}


@end







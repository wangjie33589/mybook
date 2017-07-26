//
//  ViewController.m
//  TableViewEdit
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
    
    _array = [[NSMutableArray alloc] initWithObjects:@"武松",@"武大郎",@"李逵",@"鲁智深", nil];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //设置键盘在scrollView拖动时是否消失。
    _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    return cell;
}

////scrollView将要开始拖拽时的回调方法。
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    [self.view endEditing:YES];
//}


- (IBAction)editButtonClick:(UIButton *)sender {
    //进入或退出编辑模式。YES为编辑模式，NO为普通模式
    [_tableView setEditing:!_tableView.editing animated:YES];
}

- (IBAction)addButtonClick:(UIButton *)sender {
    if (_textField.text.length>0) {
        [_array addObject:_textField.text];
        
        //数据源修改后，需要立刻刷新tableView.
        //[_tableView reloadData];
        
        NSIndexPath *path = [NSIndexPath indexPathForRow:_array.count-1 inSection:0];
        
        //动画添加行。
        [_tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationTop];
        
        _textField.text = @"";
    }
}

//设置某一行的编辑样式，默认情况下是删除样式。编辑样式仅仅影响tableView进入编辑模式时cell左侧显示的图标。无论是删除样式还是添加样式，点击图标之后都会执行commitEditingStyle方法。
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

//提交某行cell的编辑样式的回调。
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d",indexPath.row);
    
    [_array removeObjectAtIndex:indexPath.row];
    
    //[_tableView reloadData];
    
    //动画删除行
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

//设置删除按钮的标题
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}


//当tableViewCell发生移动时的回调方法。只要实现这个方法，tableView在进入编辑模式时，cell右侧就会出现滑动图标。
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    NSString *str = [_array objectAtIndex:sourceIndexPath.row];
    
    //[str retain];
    
    //先把要移动的对象从数组中移除
    [_array removeObjectAtIndex:sourceIndexPath.row];
    
    //再把对象插入目标位置。
    [_array insertObject:str atIndex:destinationIndexPath.row];
    
    //[str release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_array release];
    [_textField release];
    [_tableView release];
    [super dealloc];
}
@end

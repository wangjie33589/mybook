//
//  LeftVC.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/27.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "LeftVC.h"
#import "GroupTableDAO.h"
#import "MenuTableDAO.h"
#import "ZYDish.h"
#import "DetailVC.h"
#import "OrderTableDAO.h"
#import "MyOrderVC.h"

@interface LeftVC ()

@end

@implementation LeftVC

//@synthesize sectionTitleArray = _sectionTitleArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _kindView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%dicon.png",_index+1]];
    
    self.sectionTitleArray = [GroupTableDAO selectAllKindsOfGroup:_index+1];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _dishArray = [[NSMutableArray alloc] initWithCapacity:_sectionTitleArray.count];
    
    for (int i = 0; i<_sectionTitleArray.count; i++) {
        NSString *kind = [_sectionTitleArray objectAtIndex:i];
        
        NSArray *arr = [MenuTableDAO selectAllDishOfKind:kind];
        [_dishArray addObject:arr];
    }
    _scrollView.pagingEnabled = YES;
    
    _scrollView.delegate = self;
    
    [self resetScrollView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resetCountLabel) name:@"orderDish" object:nil];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self resetCountLabel];
}

#pragma mark- tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sectionTitleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:[_sectionTitleArray objectAtIndex:section] forState:UIControlStateNormal];
    button.tag = section;
    [button setBackgroundImage:[UIImage imageNamed:@"line31.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(headerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == _currentOpenSection) {
        return [[_dishArray objectAtIndex:section] count];
    }else{
        return 0;
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        [cell autorelease];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.detailTextLabel.textColor = [UIColor yellowColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 270, 44)];
        imgView.image = [UIImage imageNamed:@"line32.png"];
        imgView.tag = 5;
        [cell.contentView addSubview:imgView];
        imgView.hidden = YES;
        [imgView release];
    }
    UIImageView *imgView = (UIImageView *)[cell viewWithTag:5];
    
    
    if (indexPath.row == _currentSelectedRow) {
        imgView.hidden = NO;
    }else{
        imgView.hidden = YES;
    }
    
    ZYDish *dish = [[_dishArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"  %@",dish.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d元/%@",dish.price,dish.unit];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _currentSelectedRow = indexPath.row;
    
    [_tableView reloadData];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    
    [CommonUtil flipView:cell];
    
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width*indexPath.row, 0) animated:YES];
    
    
}


#pragma mark- button
- (void)headerButtonClick:(UIButton *)sender{
    
    if (sender.tag == _currentOpenSection) {
        return;
    }
    
    //可变索引集
    NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
    
    [set addIndex:_currentOpenSection];
    _currentOpenSection = sender.tag;
    [set addIndex:_currentOpenSection];
    
    _currentSelectedRow = 0;
    
    [_tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
    
    [self resetScrollView];
    
    [_scrollView setContentOffset:CGPointMake(0, 0)];
    
    
}

- (IBAction)detailButtonClick:(UIButton *)sender {
    DetailVC *vc = [[DetailVC alloc] init];
    
    vc.modalPresentationStyle = UIModalPresentationFormSheet;
    
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    ZYDish *dish = [[_dishArray objectAtIndex:_currentOpenSection] objectAtIndex:_currentSelectedRow];
    
    vc.dish = dish;
    
    [self presentViewController:vc animated:YES completion:nil];
    [vc release];
}

- (IBAction)orderDishClick:(UIButton *)sender {
    if (!_animationView) {
        _animationView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:_animationView];
    }
    //做动画
    _animationView.frame = _scrollView.frame;
    ZYDish *dish = [[_dishArray objectAtIndex:_currentOpenSection] objectAtIndex:_currentSelectedRow];
    _animationView.image = [UIImage imageNamed:dish.picName];
    _animationView.alpha = 1;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    _animationView.frame = _countLabel.frame;
    _animationView.alpha = 0;
    [UIView commitAnimations];
    
    //点菜，插入数据库
    
    [OrderTableDAO orderDish:dish];
    
    //发一个通知，让所有leftVC都调用resetCountLabel
    [[NSNotificationCenter defaultCenter] postNotificationName:@"orderDish" object:self];
}

- (IBAction)myOrderButtonClick:(UIButton *)sender {
    MyOrderVC *vc = [[MyOrderVC alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
    
    [vc release];
}



#pragma mark- scrollView

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _scrollView) {
        int index = scrollView.contentOffset.x/scrollView.frame.size.width;
        
        _currentSelectedRow = index;
        [_tableView reloadData];
        
        
        UITableViewCell *cell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:_currentOpenSection]];
        
        [CommonUtil flipView:cell];
        
        [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:_currentOpenSection] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        
        
    }
}

//重置scrollView
- (void)resetScrollView{
    NSArray *array = [_dishArray objectAtIndex:_currentOpenSection];
    
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*array.count, _scrollView.frame.size.height);
    
    //每天切换图片之前，先移除上次添加的图片。
    for (UIView *view in [_scrollView subviews]) {
        if (view.tag == 6) {
            [view removeFromSuperview];
        }
    }
    
    for (int i = 0; i<array.count; i++) {
        ZYDish *dish = [array objectAtIndex:i];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i*_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        imgView.image = [UIImage imageNamed:dish.picName];
        imgView.tag = 6;
        [_scrollView addSubview:imgView];
        [imgView release];
    }
    
    
}

- (void)resetCountLabel{
    int count = [OrderTableDAO selectCountOfOrderedDishes];
    
    _countLabel.text = [NSString stringWithFormat:@"已经点了%d种菜",count];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [_animationView release];
    [_dishArray release];
    [_sectionTitleArray release];
    [_kindView release];
    [_tableView release];
    [_scrollView release];
    [_countLabel release];
    [super dealloc];
}
@end

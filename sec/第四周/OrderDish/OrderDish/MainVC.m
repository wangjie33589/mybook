//
//  MainVC.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/27.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "MainVC.h"
#import "SecondVC.h"
#import "LeftVC.h"
#import "RecommandVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = @[@"zctj.png",@"cp.png",@"lc.png",@"rc.png",@"tl.png",@"zs.png",@"jsyl.png"];
    
    [_array retain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.backgroundColor = [UIColor clearColor];
    
    _tableView.rowHeight = 100;
    
    
    
    for (int i = 0; i<7; i++) {
        LeftVC *vc = nil;
        if (i == 0) {
            vc = [[RecommandVC alloc] init];
        }else{
            vc = [[LeftVC alloc] init];
        }
        vc.index = i;
        
        //添加子视图控制器。
        [self addChildViewController:vc];
        [vc release];
    }
    
    LeftVC *vc = [self.childViewControllers objectAtIndex:0];
    
    [self.view addSubview:vc.view];
    [self.view bringSubviewToFront:_tableView];
    [self.view bringSubviewToFront:_backButton];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor = [UIColor clearColor];
    }
    
    if (indexPath.row == _selectedRow) {
        NSString *picName = [NSString stringWithFormat:@"h%@",[_array objectAtIndex:indexPath.row]];
        cell.imageView.image = [UIImage imageNamed:picName];
    }else{
        cell.imageView.image = [UIImage imageNamed:[_array objectAtIndex:indexPath.row]];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedRow = indexPath.row;
    [_tableView reloadData];
    
    LeftVC *vc = [self.childViewControllers objectAtIndex:indexPath.row];
    
    //如果视图A已经是视图B的子视图，那么B addSubview A，会把A 提到最顶层。
    [self.view addSubview:vc.view];
    
    [self.view bringSubviewToFront:_tableView];
    [self.view bringSubviewToFront:_backButton];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gobackClick:(UIButton *)sender {
    SecondVC *vc = [[SecondVC alloc] init];
    [CommonUtil changeWindowRootViewcontroller:vc];
    [vc release];
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
    [_array release];
    [_tableView release];
    [_backButton release];
    [super dealloc];
}
@end








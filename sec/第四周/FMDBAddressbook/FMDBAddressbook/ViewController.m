//
//  ViewController.m
//  FMDBAddressbook
//
//  Created by sunhuayu on 15/8/26.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"


@interface ViewController (){
    NSMutableArray      *_array;
}


@end




@implementation ViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self refreshAllPeople];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [[NSMutableArray alloc] init];
    
    //[self refreshAllPeople];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [cell autorelease];
    }
    
    People *p = [_array objectAtIndex:indexPath.row];
    cell.textLabel.text = p.name;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    People *p = [_array objectAtIndex:indexPath.row];
    //SecondVC *vc = [[SecondVC alloc] init];
    
    //从storyboard中加载viewController
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondVC *vc = [storyboard instantiateViewControllerWithIdentifier:@"second"];
    
    vc.p = p;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    People *p = [_array objectAtIndex:indexPath.row];
    //删除这个联系人
    [PeopleDAO deletePeople:p.peopleID];
    //删除这个联系人的所有电话
    [NumberDAO deleteNumberOfPeople:p.peopleID];
    
    [_array removeObjectAtIndex:indexPath.row];
    [_tableView reloadData];
    
    
}


- (void)refreshAllPeople{
    //setArray把数组中的内容设置为另一个数组中的内容。
    [_array setArray:[PeopleDAO selectAllPeople]];
    
    [_tableView reloadData];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end

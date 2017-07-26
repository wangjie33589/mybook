//
//  ViewController.m
//  AddressBookGetAll
//
//  Created by 孙 化育 on 15-6-17.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "ViewController.h"
#import "People.h"
#import "ChineseToPinyin.h"

#import <AddressBook/AddressBook.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc{
    [_resultArray release];
    [_display release];
    [_searchBar release];
    [_array release];
    [_tableView release];
    [_peopleDic release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    for (int i = 65; i<91; i++) {
//        NSString *ch = [[NSString alloc] initWithBytes:&i length:1 encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",ch);
//    }
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.sectionIndexColor = [UIColor redColor];
    
    _array = [[NSMutableArray alloc] init];
    _resultArray = [[NSMutableArray alloc] init];
    _peopleDic = [[NSMutableDictionary alloc] init];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 40)];
    
    _searchBar.scopeButtonTitles = @[@"按照姓名搜索",@"按照电话号码搜索"];
    
        //tintColor前景色
    _searchBar.tintColor = [UIColor redColor];
    
    _searchBar.barTintColor = [UIColor greenColor];
    
        //tableHeaderView表头，一个表只有一个表头。
    _tableView.tableHeaderView = _searchBar;
    
        //创建搜索结果展示器，并和searchBar绑定
    _display = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    
        //设置搜索代理
    _display.delegate = self;
    
        //设置搜索结果表的数据源
    _display.searchResultsDataSource = self;
    
        //设置搜索结果表的代理
    _display.searchResultsDelegate = self;
    
    //申请通讯录使用权限
    ABAddressBookRequestAccessWithCompletion(NULL, ^(bool granted, CFErrorRef error) {
        if (granted) {
            NSLog(@"权限申请成功");
        }else{
            NSLog(@"权限申请失败");
            
        }
        
        //创建通讯录
        ABAddressBookRef abRef =  ABAddressBookCreateWithOptions(NULL, NULL);
        
        //复制通讯录中所有的联系人到一个数组中
        NSArray *array =  (NSArray *)ABAddressBookCopyArrayOfAllPeople(abRef);
        for (int i = 0; i<array.count; i++) {
            ABRecordRef person = [array objectAtIndex:i];
            People *p = [People new];
            p.name = (NSString *)ABRecordCopyCompositeName(person);
            ABMultiValueRef ref = ABRecordCopyValue(person, kABPersonPhoneProperty);
            p.phone = ABMultiValueCopyValueAtIndex(ref, 0);
            [_array addObject:p];
            [p release];
        }
        
        NSLog(@"%@",_array);
        
        for (People *p in _array) {
            NSString *name = [ChineseToPinyin pinyinFromChiniseString:p.name];
            NSString *firstLetter = [name substringWithRange:NSMakeRange(0, 1)];
            if (![_peopleDic objectForKey:firstLetter]) {
                    //没有这个字母的数组
                NSMutableArray *arr = [NSMutableArray array];
                [_peopleDic setObject:arr forKey:firstLetter];
            }
            [[_peopleDic objectForKey:firstLetter] addObject:p];
        }
        
            //分线程中不能刷新UI，如果需要在分线程中刷新UI，必须把刷新代码放在主线程中执行。
        
            //performSelectorOnMainThread在主线程中调用一个方法
        [self performSelectorOnMainThread:@selector(reloadTable) withObject:nil waitUntilDone:NO];
        
            //waitUntilDone YES的话表示同步执行，NO的话表示异步执行。
        
    });
    
}

    //当搜索框中的内容发生编辑时调用， 返回YES刷新结果表，返回NO不刷新结果表
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    NSLog(@"%@",searchString);
        //每次搜索之前，先清空上次的搜索结果。
    [_resultArray removeAllObjects];
    
    if (_searchBar.selectedScopeButtonIndex == 0) {
            //按照名字搜索
        for (People *p in _array) {
                //hasPrefix判断一个字符串是否包含某个前缀（是否以某个字符串开头）
                //uppercaseString把字符串中所有的字母转成大写。
            if ([[ChineseToPinyin pinyinFromChiniseString:p.name] hasPrefix:[searchString uppercaseString]]) {
                [_resultArray addObject:p];
            }
        }
    }else{
            //按照电话搜索
        for (People *p in _array) {
                //hasPrefix判断一个字符串是否包含某个前缀（是否以某个字符串开头）
                //uppercaseString把字符串中所有的字母转成大写。
            if ([[p.phone uppercaseString] hasPrefix:[searchString uppercaseString]]) {
                [_resultArray addObject:p];
            }
        }
    }
    return YES;
}

    //搜索选项发生变化时调用，是否刷新结果表
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption{
    
    [self searchDisplayController:controller shouldReloadTableForSearchString:_searchBar.text];
    
    return YES;
}

- (void)reloadTable{
    [_tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == _tableView) {
        return _peopleDic.count;
    }else{
        return 1;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView == _tableView) {
        NSArray *sortArray = [[_peopleDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
        return [sortArray objectAtIndex:section];
    }else{
        return nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _tableView) {
        NSArray *sortArray = [[_peopleDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
        return [[_peopleDic objectForKey:[sortArray objectAtIndex:section]] count];
    }else{
        return _resultArray.count;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"] autorelease];
    }
    People *p = nil;
    if (tableView == _tableView) {
        NSArray *sortArray = [[_peopleDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
        
        NSArray *arr = [_peopleDic objectForKey:[sortArray objectAtIndex:indexPath.section]];
        
        p = [arr objectAtIndex:indexPath.row];
        
    }else{
        p = [_resultArray objectAtIndex:indexPath.row];
    }
    
    
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = p.phone;
    return cell;
}

    //设置区头标题的数组，设置之后就可以显示右侧的索引条。
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSArray *sortArray = [[_peopleDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    return sortArray;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

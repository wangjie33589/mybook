//
//  SecondVC.m
//  FMDBAddressbook
//
//  Created by sunhuayu on 15/8/26.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "SecondVC.h"
#import "FMDatabase.h"



@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    if (_p) {
        //点击某个联系人进来的
        _nameField.text = _p.name;
        [self refreshNumbers];
    }
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
    }
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *number = [_array objectAtIndex:indexPath.row];
    [NumberDAO deleteNumber:number ofPeople:_p.peopleID];
    
    [self refreshNumbers];
}




- (void)refreshNumbers{
    self.array = [NumberDAO selectAllNumbersOfPeople:_p.peopleID];
    
    [_tableView reloadData];
}


- (IBAction)insertButtonClick:(UIButton *)sender {
    
    if (_nameField.text.length<=0) {
        //[self showAlert:@"姓名不能为空"];
        SHOW_ALERT(@"姓名不能为空");
        return;
    }
    
    if (_numberField.text.length<=0) {
        //[self showAlert:@"电话不能为空"];
        SHOW_ALERT(@"电话不能为空")
        return;
    }
    
    if (!_p) {
        _p = [[People alloc] init];
        _p.name = _nameField.text;
        [PeopleDAO insertPeople:_nameField.text];
        int maxID = [PeopleDAO selectMaxPeopleID];
        _p.peopleID = maxID;
    }
    
    
    [NumberDAO insertNumber:_numberField.text forPeople:_p.peopleID];
    
    _numberField.text = @"";
    
    [self refreshNumbers];
}



- (void)showAlert:(NSString *)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
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
    [_array release];
    [_p release];
    [_numberField release];
    [_tableView release];
    [super dealloc];
}
@end

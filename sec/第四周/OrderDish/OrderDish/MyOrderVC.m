//
//  MyOrderVC.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/29.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "MyOrderVC.h"
#import "OrderTableDAO.h"
#import "MyOrderCell.h"
#import "ZYRecord.h"
#import "SendOrderVC.h"

@interface MyOrderVC ()

@end

@implementation MyOrderVC

- (void)dealloc{
    [_array release];
    [_tableView release];
    [_priceLabel release];
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [_array setArray:[OrderTableDAO selectAllOrderedDishes]];
    
    [_tableView reloadData];
    
    [self resetPriceLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [[NSMutableArray alloc] init];
    
    [_tableView registerNib:[UINib nibWithNibName:@"MyOrderCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveKeyboardNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [self resetPriceLabel];
}

- (void)receiveKeyboardNotification:(NSNotification *)noti{
    CGRect rect = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if (rect.origin.y>=768) {
        //键盘消失
        NSLog(@"键盘消失");
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }else{
        NSLog(@"键盘出现");
        
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 300, 0);
        //键盘出现
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    ZYRecord *record = [_array objectAtIndex:indexPath.row];
    
    cell.indexLabel.text = [NSString stringWithFormat:@"%d",indexPath.row+1];
    cell.nameLabel.text = record.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"%d",record.price];
    cell.kindLabel.text = record.kind;
    cell.numberField.text = [NSString stringWithFormat:@"%d",record.number];
    
    cell.numberField.delegate = self;
    
    [cell.numberField addTarget:self action:@selector(numberFieldEditingEnd:) forControlEvents:UIControlEventEditingDidEnd];
    cell.numberField.tag = indexPath.row;
    
    [cell.remarkField addTarget:self action:@selector(remarkFieldEditingEnd:) forControlEvents:UIControlEventEditingDidEnd];
    cell.remarkField.tag = indexPath.row;
    
    cell.remarkField.text = record.remark;
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZYRecord *record = [_array objectAtIndex:indexPath.row];
    
    [OrderTableDAO deleteDish:record.recordID];
    
    [_array removeObjectAtIndex:indexPath.row];
    
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    
    [self resetPriceLabel];
}



//修改备注
- (void)remarkFieldEditingEnd:(UITextField *)sender{
    ZYRecord *record = [_array objectAtIndex:sender.tag];
    record.remark = sender.text;
    [OrderTableDAO updateDishRemark:sender.text forDish:record.recordID];
    
}

- (void)numberFieldEditingEnd:(UITextField *)sender{
    //NSLog(@"数量修改");
    
    ZYRecord *record = [_array objectAtIndex:sender.tag];
    
    if (sender.text.integerValue>0) {
        record.number = sender.text.integerValue;
        
        [OrderTableDAO updateDishNumber:record.number forDish:record.recordID];
    }else{
        sender.text = [NSString stringWithFormat:@"%d",record.number];
    }
    
    [self resetPriceLabel];
}

//当输入框中的内容将要发生变化时调用
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    //decimalDigitCharacterSet数字字符集，包含0-9十个字符。
    NSCharacterSet *set = [NSCharacterSet decimalDigitCharacterSet];
    
    //获得string的字符集
    
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:string];
    if ([set isSupersetOfSet:stringSet]) {
        //是纯数字字符，允许修改
        return YES;
    }else{
        return NO;
        //非数字字符
    }
}

- (IBAction)gobackClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendOrderClick:(UIButton *)sender {
    if (_array.count<=0) {
        return;
    }
    
    SendOrderVC *vc = [[SendOrderVC alloc] init];
    
    [self presentViewController:vc animated:YES completion:nil];
    
    [vc release];
    
}


- (void)resetPriceLabel{
    int totalPrice = 0;
    
    for (ZYRecord *record in _array) {
        totalPrice+=record.price*record.number;
    }
    
    _priceLabel.text = [NSString stringWithFormat:@"%d",totalPrice];
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

@end

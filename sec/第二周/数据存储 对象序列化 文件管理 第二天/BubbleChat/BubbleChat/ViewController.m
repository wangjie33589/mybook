//
//  ViewController.m
//  BubbleChat
//
//  Created by sunhuayu on 15/8/17.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "ViewController.h"
#import "OtherCell.h"
#import "SelfCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = [[NSMutableArray alloc] init];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //设置tableView分割先的样式。
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //给tableView的某个重用标示符注册一个xib，当tableView寻找这个重用标示符可重用的cell时，如果找不到就会从xib中加载一个cell返回。
    [_tableView registerNib:[UINib nibWithNibName:@"OtherCell" bundle:nil] forCellReuseIdentifier:@"other"];
    
    //给tableView的某个重用标示符注册一个cell类，当tableView寻找这个重用标示符可重用的cell时，如果找不到就会创建一个这个cell类的对象返回。
    [_tableView registerClass:[SelfCell class] forCellReuseIdentifier:@"self"];
    
    _textField.returnKeyType = UIReturnKeySend;
    _textField.enablesReturnKeyAutomatically = YES;
    
    //绑定方法，按下键盘return时调用，但是这个方法一旦绑定，点击return时，键盘就会下落。
    //[_textField addTarget:self action:@selector(textFieldEndEditing) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    
    _textField.delegate = self;
    
    
    //自动判断scrollView(包括tableView等子类)的inset，以防止scrollView顶部的内容被navigationBar盖住。
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    self.title = @"与xx聊天";
    
    _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    
    //UIKeyboardWillChangeFrameNotification,键盘frame将要发生变化时的通知。
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveKeyboardNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
    
    //self.navigationItem.title = @"与xx聊天";
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma textField
//当textField键盘点击return时调用。
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self sendButtonClick:nil];
    return YES;
}


#pragma mark-notification
- (void)receiveKeyboardNotification:(NSNotification *)notification{
    //NSLog(@"%@",notification.userInfo);
    
    //NSValue，值类，能够把结构体等基本类型转换为对象，从而可以放入数组和字典。
    NSValue *value = [notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect rect = [value CGRectValue];
    
    int curve = [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    float duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationDuration:duration];
    _inputView.frame = CGRectMake(0, rect.origin.y-44, 320, 44);
    //_tableView.frame = CGRectMake(0, 0, 320, _inputView.frame.origin.y);
    
    _tableView.contentInset = UIEdgeInsetsMake(64, 0, 568-rect.origin.y, 0);
    
    
    float offSet = _tableView.contentOffset.y+(568-rect.origin.y);
    
    if (_tableView.contentSize.height>_tableView.frame.size.height-64-(568-rect.origin.y)) {
        if (offSet+64>_tableView.contentSize.height-(_tableView.frame.size.height-64-(568-rect.origin.y))) {
            offSet = _tableView.contentSize.height-(_tableView.frame.size.height-64-(568-rect.origin.y))-64;
        }
        _tableView.contentOffset = CGPointMake(0, offSet);
    }
    
    [UIView commitAnimations];
    
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",_tableView.contentOffset.y);
    NSLog(@"---%f",_tableView.contentSize.height);
}

#pragma mark- button
- (IBAction)sendButtonClick:(UIButton *)sender {
    if (_textField.text.length<=0) {
        return;
    }
    
    [_array addObject:_textField.text];
    [_tableView reloadData];
    _textField.text = @"";
    
    //让tableView滚动到某个区的某一行，第二个参数是这一行显示在tableView上的位置(如果有可能)。第三个参数是否带动画。
    [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_array.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
    
}

#pragma mark-tableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *text = [_array objectAtIndex:indexPath.row];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(200, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    
    return rect.size.height+20+10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *text = [_array objectAtIndex:indexPath.row];
    
    //计算一段文本显示出来的尺寸。第一个参数是指定宽度算高度或指定高度算宽度。第二个参数是计算选项。第三个参数是文本属性（字体，折行方式）。第四个参数是文本绘制上下文。
    CGRect rect = [text boundingRectWithSize:CGSizeMake(200, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    
    if (indexPath.row%2 == 0) {
        //如果某个重用标示符注册过cell，那么寻找这个标示符的cell时，始终能够获得cell，不可能为nil。
        OtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"other"];
        
        cell.mesageLabel.text = [_array objectAtIndex:indexPath.row];
        cell.headerImageView.image = [UIImage imageNamed:@"favo_CLICK.png"];
        
        cell.mesageLabel.frame = CGRectMake(8+40+8+10, 10+8, rect.size.width, rect.size.height);
        
        cell.bubbleImageView.frame = CGRectMake(56, 8, rect.size.width+20, rect.size.height+20);
        
        return cell;
    }else{
        SelfCell *cell = [tableView dequeueReusableCellWithIdentifier:@"self"];
        cell.headerImageView.image = [UIImage imageNamed:@"ali.png"];
        cell.messageLabel.text = [_array objectAtIndex:indexPath.row];
        
        cell.messageLabel.frame = CGRectMake(320-8-40-8-10-rect.size.width, 10+8, rect.size.width, rect.size.height);
        
        cell.bubbleImageView.frame = CGRectMake(320-8-40-8-rect.size.width-20, 8, rect.size.width+20, rect.size.height+20);
        
        return cell;
    }
    
    
    
    
}

#pragma mark-memory

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_array release];
    [_tableView release];
    [_inputView release];
    [_textField release];
    [super dealloc];
}
@end

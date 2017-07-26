//
//  ViewController.m
//  UCustomKeyboard
//
//  Created by sun huayu on 12-11-30.
//  Copyright (c) 2012年 sun huayu. All rights reserved.
//

#import "ViewController.h"
#import "UCustomKeyboard.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    textField1.delegate = self;
    textField2.delegate = self;
    
    UCustomKeyboard *keyBoard = [[UCustomKeyboard alloc] init];
    keyBoard.textField = textField2;
    [keyBoard release];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [lable1 release];
    [lable2 release];
    [textField1 release];
    [textField2 release];
    [super dealloc];
}

- (void)viewDidUnload {
    [lable1 release];
    lable1 = nil;
    [lable2 release];
    lable2 = nil;
    [textField1 release];
    textField1 = nil;
    [textField2 release];
    textField2 = nil;
    [super viewDidUnload];
}
@end

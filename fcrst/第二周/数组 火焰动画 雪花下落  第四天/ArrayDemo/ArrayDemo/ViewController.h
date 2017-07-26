//
//  ViewController.h
//  ArrayDemo
//
//  Created by 孙 化育 on 15-7-23.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
        //c语言中的数组。
    int             _cArray[10];
    
    
        //OC中的数组,
        //NSArray叫做不可变数组。不可变数组必须在创建时指定其中的内容，而且指定之后，内容不可变（不能添加新的对象，也不能删除里面的对象）
    NSArray         *_array;
    
    
        //NSMutableArray叫做可变数组。
    NSMutableArray  *_mArray;
}


@end











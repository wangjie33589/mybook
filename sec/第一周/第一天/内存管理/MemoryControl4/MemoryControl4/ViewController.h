//
//  ViewController.h
//  MemoryControl4
//
//  Created by sunhuayu on 15/8/10.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSObject            *_obj;
}

//@property (nonatomic,retain)NSObject *obj;

- (void)setObj:(NSObject *)obj;

- (NSObject *)obj;

@property (nonatomic,retain)UILabel *label;


@end


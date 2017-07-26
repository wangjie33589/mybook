//
//  ViewController.m
//  GIFAnimation
//
//  Created by 孙 化育 on 15-7-23.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "ViewController.h"
#import <ImageIO/ImageIO.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"123" ofType:@"gif"]];
    
        //通过data获取image的数据源
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    
        //获取帧数
    size_t count = CGImageSourceGetCount(source);
    
    NSMutableArray* tmpArray = [NSMutableArray array];
    for (size_t i = 0; i < count; i++)
        {
            //获取图像
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, i, NULL);
        
            //生成image
        UIImage *image = [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
        
        [tmpArray addObject:image];
        
        CGImageRelease(imageRef);
        }
    CFRelease(source);
    
    
    _imgView.animationImages = tmpArray;
    
    [_imgView startAnimating];
    
    
    int i = 0;
//    for (UIImage *img in tmpArray) {
//            //写文件
//        NSData *imageData = UIImagePNGRepresentation(img);
//        
//        NSString *pathNum = [[self backPath] stringByAppendingPathComponent:[NSString stringWithFormat:@%d.png,i]];
//        [imageData writeToFile:pathNum atomically:NO];
//        i++;
//    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

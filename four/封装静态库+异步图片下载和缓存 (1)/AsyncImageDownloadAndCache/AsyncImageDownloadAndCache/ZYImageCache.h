//
//  ZYImageCache.h
//  AsyncImageDownloadAndCache
//
//  Created by sunhuayu on 15/10/12.
//  Copyright © 2015年 sunhuayu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYImageCache : NSObject{
    //用于存放图片缓存的字典。
    NSMutableDictionary *_imageDic;
}

+ (ZYImageCache *)sharedCache;

//尝试从缓存中寻找图片，如果找不到，再进行下载
- (void)getImageWithURL:(NSURL *)url completionBlock:(void(^)(UIImage *img))block;


//下载图片
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void(^)(UIImage *img))block;



- (unsigned long long)getDiskSize;

//获取内存中缓存的大小
- (unsigned long long)getMemorySize;

//清除内存中的缓存
- (void)clearMemory;

//清除外存中的缓存
- (void)clearDisk;


@end












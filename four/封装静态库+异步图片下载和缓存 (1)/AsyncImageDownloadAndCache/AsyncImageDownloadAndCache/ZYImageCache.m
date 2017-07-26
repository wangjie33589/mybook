//
//  ZYImageCache.m
//  AsyncImageDownloadAndCache
//
//  Created by sunhuayu on 15/10/12.
//  Copyright © 2015年 sunhuayu. All rights reserved.
//

#import "ZYImageCache.h"
#import "NSString+MD5.h"

ZYImageCache *__cache = nil;


@implementation ZYImageCache

+ (ZYImageCache *)sharedCache{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __cache = [[ZYImageCache alloc] init];
    });
    
    return __cache;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _imageDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (NSString *)cachePath{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Cache"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return path;
}

- (void)getImageWithURL:(NSURL *)url completionBlock:(void(^)(UIImage *img))block{
    NSString *md5 = [url.absoluteString MD5];
    //先从内存缓存中寻找是否有这张图片。
    if ([_imageDic objectForKey:md5]) {
        //内存中存在，不需要下载
        if (block) {
            block([_imageDic objectForKey:md5]);
        }
    }else{
        //再判断外存中是否存在
        NSString *filePath = [NSString stringWithFormat:@"%@/%@",[self cachePath],md5];
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            //外存中存在
            //把图片读入内存，存入缓存字典，然后使用
            UIImage *img = [UIImage imageWithContentsOfFile:filePath];
            [_imageDic setObject:img forKey:md5];
            if (block) {
                block(img);
            }
        }else{
            //外存中也不存在
            //下载图片，下载完成之后，存入内存和外存缓存中，然后使用。
            [self downloadImageWithURL:url completionBlock:^(UIImage *img) {
                //先存入外存
                NSData *data = UIImagePNGRepresentation(img);
                [data writeToFile:filePath atomically:YES];
                //再存入内存
                [_imageDic setObject:img forKey:md5];
                if (block) {
                    block(img);
                }
            }];
        }
    }
    
}


- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void(^)(UIImage *img))block{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block(img);
            }
        });
    });
}

- (unsigned long long )getDiskSize{
    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:[self cachePath]];
    unsigned long long size = 0;
    while ([enumerator nextObject]) {
        size += [[enumerator fileAttributes] fileSize];
    }
    return size;
}

- (unsigned long long)getMemorySize{
    unsigned long long size = 0;
    for (UIImage *img in [_imageDic allValues]) {
        NSData *data = UIImagePNGRepresentation(img);
        size += data.length;
    }
    
    return size;
}

- (void)clearMemory{
    [_imageDic removeAllObjects];
}

- (void)clearDisk{
    [[NSFileManager defaultManager] removeItemAtPath:[self cachePath] error:nil];
}

@end









//
//  UIImageView+WebCache.m
//  AsyncImageDownloadAndCache
//
//  Created by sunhuayu on 15/10/12.
//  Copyright © 2015年 sunhuayu. All rights reserved.
//

#import "UIImageView+WebCache.h"
#import "ZYImageCache.h"

@implementation UIImageView (WebCache)


- (void)setImageWithURL:(NSURL *)url{
    self.image = nil;
    
    [[ZYImageCache sharedCache] getImageWithURL:url completionBlock:^(UIImage *img) {
        self.image = img;
    }];
}


@end







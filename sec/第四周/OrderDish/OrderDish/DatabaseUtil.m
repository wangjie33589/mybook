//
//  DatabaseUtil.m
//  OrderDish
//
//  Created by sunhuayu on 15/8/28.
//  Copyright (c) 2015年 sunhuayu. All rights reserved.
//

#import "DatabaseUtil.h"

FMDatabase *__db = nil;

@implementation DatabaseUtil


+ (NSString *)databasePath{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/database.sqlite"];
}


+ (void)moveDatabaseFileIntoDocumentsIfNeeded{
    NSString *DocumentsFilePath = [self databasePath];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:DocumentsFilePath]) {
        NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"database" ofType:@"sqlite"];
        [manager copyItemAtPath:sourcePath toPath:DocumentsFilePath error:nil];
    }
}


+ (FMDatabase *)shareDB{
    if (!__db) {
        __db = [[FMDatabase alloc] initWithPath:[self databasePath]];
    }
    
    return __db;
}



@end













//
//  Woman.h
//  PeopleProperty
//
//  Created by 孙 化育 on 15-7-15.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "ZYPeople.h"
#import "Man.h"

@interface Woman : ZYPeople

    //女性特有，找男朋友方法。
- (BOOL)findBoyFriend:(Man *)boy;


- (ZYPeople *)makeBaby;


@end










//
//  ViewController.h
//  EightAnimation
//
//  Created by 孙 化育 on 15-7-23.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    float           _currentAngle;
    float           _angleSpeed;
    
    __weak IBOutlet UIImageView *_sunView;
    
    BOOL            _isUp;
    
    BOOL            _isChange;
}


@end








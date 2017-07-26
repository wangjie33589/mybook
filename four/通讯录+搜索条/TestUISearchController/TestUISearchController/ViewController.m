//
//  ViewController.m
//  TestUISearchController
//
//  Created by mike on 15/6/2.
//  Copyright (c) 2015年 mike. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
@interface ViewController () <UISearchControllerDelegate>
@property (nonatomic,strong) UISearchController *vc2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TableViewController *vc1 = [[TableViewController alloc] init];
    self.vc2 = [[UISearchController alloc] initWithSearchResultsController:vc1];
    _vc2.delegate = self;
    
    
    
//    NSLog(@"%@",self.view.constraints);

    
}
- (IBAction)pressed:(id)sender {
    [self presentSearchController:_vc2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UISearchControllerDelegate

- (void)presentSearchController:(UISearchController *)searchController
{
    [self presentViewController:searchController
                       animated:YES
                     completion:^{
                         
                     }];
}

@end

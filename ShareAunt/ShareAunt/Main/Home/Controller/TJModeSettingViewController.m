//
//  TJModeSettingViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/19.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJModeSettingViewController.h"

@interface TJModeSettingViewController ()

@end

@implementation TJModeSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
     [self setupUI];
     
}

 - (void)setupUI {
     
     self.title = @"模式设置";
     self.view.backgroundColor = [UIColor whiteColor];
     
 }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

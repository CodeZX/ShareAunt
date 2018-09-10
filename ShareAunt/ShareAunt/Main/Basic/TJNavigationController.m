//
//  TJNavigationController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/10.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJNavigationController.h"

@interface TJNavigationController ()

@end

@implementation TJNavigationController


#pragma mark - life cycle methods
+ (void)initialize {
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent
    ;
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //    [[UINavigationBar appearance] setBarTintColor:[UIColor jk_colorWithHex:0x1C1C22]];
    UIImage *bgImage = [UIImage jk_imageWithColor:[UIColor jk_colorWithHex:0x1C1C22]];
    [[UINavigationBar appearance] setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];

//     设置字体颜色大小
    NSMutableDictionary * dictM = [NSMutableDictionary dictionary];
    // 字体大小
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    // 字体颜色
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:dictM];

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
    
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

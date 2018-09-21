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
    UIImage *bgImage = [UIImage jk_imageWithColor:MOTIf_BACKGROUND_COLOR];
    [[UINavigationBar appearance] setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:bgImage];

//     设置字体颜色大小
    NSMutableDictionary * dictM = [NSMutableDictionary dictionary];
    // 字体大小
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    // 字体颜色
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:dictM];

    
//     //自定义返回按钮
//     UIImage *backButtonImage = [[UIImage imageNamed:@"return"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 0, 0, 0)];
//     [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
     //将返回按钮的文字position设置不在屏幕上显示
     [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, 0) forBarMetrics:UIBarMetricsDefault];
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

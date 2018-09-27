//
//  TJMainViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/18.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJMainViewController.h"
#import "TJHomeViewController.h"
#import "TJAuntExistenceViewController.h"
#import "TJUserCenterViewController.h"

@interface TJMainViewController ()

@end

@implementation TJMainViewController
- (instancetype)init {
    if (self = [super init]) {
        self.titleSizeNormal = 18;
        self.titleSizeSelected = 18;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = [UIScreen mainScreen].bounds.size.width / 2;
//        self.viewTop = kNavigationBarHeight + kWMHeaderViewHeight;
        self.titleColorSelected = MOTIF_BUTTON_COLOR;
        self.titleColorNormal = [UIColor jk_colorWithHex:0x909090];
        self.showOnNavigationBar = YES;
        self.selectIndex = 0;
        self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        self.automaticallyCalculatesItemWidths = YES;
        self.itemMargin = 20;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];

}

- (void)setupUI {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_user"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClicked:)];
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"message"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClicked:)];
}


- (void)leftBarButtonItemClicked:(id)sender {
    
    TJUserCenterViewController *VC = [[TJUserCenterViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)rightBarButtonItemClicked:(id)sender {
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numbersOfTitlesInMenuView:(WMMenuView *)menu {
    return 2;
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return 2;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    
    return CGRectMake(0, 0, SCREEN_WIDTH, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    
    return CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    if (index == 0) {
        return [[TJHomeViewController alloc]init];
    } else if (index == 1) {
        return [[TJAuntExistenceViewController alloc]init];
    }
    return [[TJHomeViewController alloc]init];
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    if (index == 0) {
        return @"首页";
    } else if (index == 1) {
        return @"阿姨生活";
    }
    return @"标题";
}


@end

//
//  TJMyOrderViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/26.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJMyOrderViewController.h"
#import "TJAllOrderViewController.h"
#import "TJUnderWayOrderViewController.h"
#import "TJNotEvaluatedOrderViewController.h"
#import "TJFinishOrderViewController.h"

@interface TJMyOrderViewController ()
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) NSArray *controllerArray;
@end

@implementation TJMyOrderViewController

- (instancetype)init {
    if (self = [super init]) {
        self.titleSizeNormal = 18;
        self.titleSizeSelected = 18;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = [UIScreen mainScreen].bounds.size.width / 2;
        //        self.viewTop = kNavigationBarHeight + kWMHeaderViewHeight;
        self.titleColorSelected = MOTIF_BUTTON_COLOR;
        self.titleColorNormal = [UIColor jk_colorWithHex:0x909090];
//        self.showOnNavigationBar = YES;
        self.selectIndex = 0;
        self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        self.automaticallyCalculatesItemWidths = YES;
        self.itemMargin = 20;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)numbersOfTitlesInMenuView:(WMMenuView *)menu {
    return self.titleArray.count;
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.controllerArray.count;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    
    return CGRectMake(0, 0, SCREEN_WIDTH, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    
    return CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT);
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    return [[NSClassFromString(self.controllerArray[index]) alloc]init];
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    return self.titleArray[index];
}






#pragma mark -------------------------- lazy load ----------------------------------------
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"全部订单",@"进行中",@"待评价",@"已完成"];
    }
    return _titleArray;
}


- (NSArray *)controllerArray {
    if (!_controllerArray) {
        _controllerArray = @[@"TJAllOrderViewController",@"TJUnderWayOrderViewController",@"TJNotEvaluatedOrderViewController",@"TJFinishOrderViewController"];
    }
    return _controllerArray;
}
@end

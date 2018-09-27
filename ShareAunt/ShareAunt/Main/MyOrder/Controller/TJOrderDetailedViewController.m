//
//  TJOrderDetailedViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/26.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJOrderDetailedViewController.h"
#import "TJOrderArriveView.h"

@interface TJOrderDetailedViewController ()
@property (nonatomic,weak) TJOrderArriveView *arriveView;
@end

@implementation TJOrderDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


- (void)setupUI {
    
    self.title = @"订单详情";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    TJOrderArriveView *arriveView = [[TJOrderArriveView alloc]init];
    [self.view addSubview:arriveView];
    self.arriveView = arriveView;
    [self.arriveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(arriveView.width).multipliedBy(SCALE_H(375, 349));
    }];
    
    
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

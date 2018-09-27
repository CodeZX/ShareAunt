//
//  TJMyWalletHeadView.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/26.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJMyWalletHeadView.h"


@interface TJMyWalletHeadView  ()
@property (nonatomic,weak) UILabel *titleLab;
@property (nonatomic,weak) UILabel *balanceLab;
@end
@implementation TJMyWalletHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = MOTIf_BACKGROUND_COLOR;
    __weak typeof(self) weakSelf = self;
    UILabel *titleLab = [UILabel labelWithText:@"账户余额(元)" textColor:[UIColor whiteColor] fontName:@"PingFang-SC-Medium" fontSize:14 wordSpace:0];
    [self addSubview:titleLab];
    self.titleLab = titleLab;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(15);
    }];
    
    
    UILabel *balanceLab = [UILabel labelWithText:@"0.00" textColor:[UIColor whiteColor] fontName:@"PingFang-SC-Medium" fontSize:50 wordSpace:5];
    [self addSubview:balanceLab];
    self.balanceLab = balanceLab;
    [self.balanceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf);
    }];
    
}

@end

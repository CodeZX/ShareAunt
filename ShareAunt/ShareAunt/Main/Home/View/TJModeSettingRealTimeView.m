//
//  TJModeSettingRealTime.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/21.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJModeSettingRealTimeView.h"


@interface TJModeSettingRealTimeView ()

@property (nonatomic,weak) UIButton *areaSelectBtn;
@property (nonatomic,weak) UIButton *addressSelectBtn;

@end
@implementation TJModeSettingRealTimeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    self.backgroundColor = [UIColor redColor];
    __weak typeof(self) weakSelf = self;
    UIButton *areaSelectBtn = [UIButton TJ_buttonWithTitle:@"选择区域" titleColor:[UIColor jk_colorWithHex:0x909090] titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15] imageName:@"Rightarrow" selectImageName:nil backgroundColor:[UIColor jk_colorWithHex:0x25252F]];
    [self addSubview:areaSelectBtn];
     self.areaSelectBtn = areaSelectBtn;
    [self.areaSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf);
        make.left.equalTo(weakSelf.right).multipliedBy(SCALE_k(30, 375));
        make.right.equalTo(weakSelf.right).multipliedBy(1 -  SCALE_k(30, 375));
        make.height.equalTo(areaSelectBtn.width).multipliedBy(SCALE_H(315, 30));
//        make.height.equalTo(30);
    }];
    [self.areaSelectBtn jk_setImagePosition:LXMImagePositionRight spacing:200];
    
    UIButton *addressSelectBtn = [UIButton TJ_buttonWithTitle:@"目的地点" titleColor:[UIColor jk_colorWithHex:0x909090] titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15] imageName:@"Rightarrow" selectImageName:nil backgroundColor:[UIColor jk_colorWithHex:0x25252F]];
    [self addSubview:addressSelectBtn];
    self.addressSelectBtn = addressSelectBtn;
    [self.addressSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(weakSelf).offset(CGPointMake(0, 30));
        make.centerX.equalTo(weakSelf);
        make.top.equalTo(weakSelf.areaSelectBtn.bottom).offset(20);
        make.left.equalTo(weakSelf.right).multipliedBy(SCALE_k(30, 375));
        make.right.equalTo(weakSelf.right).multipliedBy(1 -  SCALE_k(30, 375));
        make.height.equalTo(addressSelectBtn.width).multipliedBy(SCALE_H(315, 30));
        //        make.height.equalTo(30);
    }];
    [self.addressSelectBtn jk_setImagePosition:LXMImagePositionRight spacing:200];
    
}

@end

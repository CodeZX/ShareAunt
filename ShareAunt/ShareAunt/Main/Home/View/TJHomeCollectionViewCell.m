//
//  TJHomeCollectionViewCell.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/19.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJHomeCollectionViewCell.h"
@interface TJHomeCollectionViewCell ()

@property (nonatomic,weak) UIView *containerView;
// 订单号
@property (nonatomic,weak) UILabel *orderNumberLab;
@property (nonatomic,weak) UILabel *orderNumberValueLab;

// 地址
@property (nonatomic,weak) UILabel *addressLab;
@property (nonatomic,weak) UILabel *addressValueLab;

// 内容
@property (nonatomic,weak) UILabel *jobDescriptionLab;
@property (nonatomic,weak) UILabel *jobDescriptionValueLab;

// 时长
@property (nonatomic,weak) UILabel *durationLab;
@property (nonatomic,weak) UILabel *durationValueLab;

@end
@implementation TJHomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    UIView *containerView = [[UIView alloc]init];
    containerView.layer.borderColor = [UIColor jk_colorWithHex:0x201B17].CGColor;
    containerView.layer.borderWidth = 1;
    [self.contentView addSubview:containerView];
    self.containerView = containerView;
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(5, 5, 50, 5));
    }];
    
    __weak typeof(self) weakSelf = self;
    UILabel *orderNumberLab = [UILabel labelWithText:@"订单号:" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:orderNumberLab];
    self.orderNumberLab = orderNumberLab;
    [self.orderNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(12);
        make.left.equalTo(10);
    }];
    UILabel *orderNumberValueLab = [UILabel labelWithText:@"00001" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:orderNumberValueLab];
    self.orderNumberValueLab = orderNumberValueLab;
    [self.orderNumberValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.orderNumberLab);
        make.left.equalTo(weakSelf.orderNumberLab.right).offset(5);
    }];
    
    
    UILabel *addressLab = [UILabel labelWithText:@"工作地点:" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:addressLab];
    self.addressLab = addressLab;
    [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.orderNumberLab.bottom);
        make.left.equalTo(weakSelf.orderNumberLab);
    }];
    UILabel *addressValueLab = [UILabel labelWithText:@"临空经济园区" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:addressValueLab];
    self.addressValueLab = addressValueLab;
    [self.addressValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.addressLab);
        make.left.equalTo(weakSelf.addressLab.right).offset(5);
    }];
    
    
    UILabel *jobDescriptionLab = [UILabel labelWithText:@"工作内容:" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:jobDescriptionLab];
    self.jobDescriptionLab = jobDescriptionLab;
    [self.jobDescriptionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.addressValueLab.bottom);
        make.left.equalTo(weakSelf.orderNumberLab);
    }];
    UILabel *jobDescriptionValueLab = [UILabel labelWithText:@"日常保洁" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:jobDescriptionValueLab];
    self.jobDescriptionValueLab = jobDescriptionValueLab;
    [self.jobDescriptionValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.jobDescriptionLab);
        make.left.equalTo(weakSelf.jobDescriptionLab.right).offset(5);
    }];
    
    UILabel *durationLab = [UILabel labelWithText:@"工作时长:" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:durationLab];
    self.durationLab = durationLab;
    [self.durationLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.jobDescriptionLab.bottom);
        make.left.equalTo(weakSelf.orderNumberLab);
    }];
    UILabel *durationValueLab = [UILabel labelWithText:@"2小时" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:durationValueLab];
    self.durationValueLab = durationValueLab;
    [self.durationValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.durationLab);
        make.left.equalTo(weakSelf.jobDescriptionLab.right).offset(5);
    }];
    
}
@end

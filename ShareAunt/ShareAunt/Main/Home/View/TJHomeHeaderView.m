//
//  TJHomeHeaderView.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/19.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJHomeHeaderView.h"


@interface TJHomeHeaderView ()

@property (nonatomic,weak) UILabel *scoreValueLab;
@end
@implementation TJHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    
    self.backgroundColor = MOTIf_BACKGROUND_COLOR;
    __weak typeof(self) weakSelf = self;
    UILabel *scoreValueLab = [UILabel labelWithText:@"95分" textColor:[UIColor whiteColor] fontName:@"PingFang-SC-Medium" fontSize:70 wordSpace:5];
//    scoreValueLab.backgroundColor = [UIColor  redColor];
    [self addSubview:scoreValueLab];
    self.scoreValueLab = scoreValueLab;
    [self.scoreValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf);
        make.top.equalTo(weakSelf.bottom).multipliedBy(SCALE_k(38, 350));
    }];
    
    UILabel *scoreLab = [UILabel labelWithText:@"服务分" textColor:[UIColor whiteColor] fontName:@"PingFang-SC-Light" fontSize:18 wordSpace:5];
//    scoreLab.backgroundColor = [UIColor redColor];
    [self addSubview:scoreLab];
//    self.scoreValueLab = scoreValueLab;
    [scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf);
        make.top.equalTo(weakSelf.scoreValueLab.bottom);
    }];
    
    
    
    UILabel *orderValueLab = [UILabel labelWithText:@"0单" textColor:[UIColor whiteColor] fontName:@"PingFang-SC-Bold" fontSize:30 wordSpace:5];
    //    scoreLab.backgroundColor = [UIColor redColor];
    orderValueLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:orderValueLab];
    //    self.scoreValueLab = scoreValueLab;
    [orderValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.right).multipliedBy(SCALE_k(82, 350));
        make.top.equalTo(weakSelf.bottom).multipliedBy(SCALE_k(161, 250));
    }];
    
    UILabel *orderLab = [UILabel labelWithText:@"今日接单" textColor:[UIColor jk_colorWithHex:0x909090] fontName:@"PingFang-SC-Regular" fontSize:12 wordSpace:0];
    //    scoreLab.backgroundColor = [UIColor redColor];
    orderLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:orderLab];
    //    self.scoreValueLab = scoreValueLab;
    [orderLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(orderValueLab);
        make.top.equalTo(orderValueLab.bottom);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor jk_colorWithHex:0x909090];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(1);
        make.height.equalTo(25);
        make.top.equalTo(orderValueLab);
        make.centerX.equalTo(weakSelf);
    }];
    
    
    UILabel *incomeValueLab = [UILabel labelWithText:@"0元" textColor:[UIColor whiteColor] fontName:@"PingFang-SC-Bold" fontSize:30 wordSpace:5];
    //    scoreLab.backgroundColor = [UIColor redColor];
    incomeValueLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:incomeValueLab];
    //    self.scoreValueLab = scoreValueLab;
    [incomeValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.right).multipliedBy(SCALE_k(255, 375));
        make.top.equalTo(weakSelf.bottom).multipliedBy(SCALE_k(161, 250));
    }];
    
    UILabel *incomeLab = [UILabel labelWithText:@"今日收益" textColor:[UIColor jk_colorWithHex:0x909090] fontName:@"PingFang-SC-Regular" fontSize:12 wordSpace:0];
    incomeValueLab.textAlignment = NSTextAlignmentCenter;
    //    scoreLab.backgroundColor = [UIColor redColor];
    [self addSubview:incomeLab];
    //    self.scoreValueLab = scoreValueLab;
    [incomeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(incomeValueLab);
        make.top.equalTo(incomeValueLab.bottom);
    }];
    
    

}
@end

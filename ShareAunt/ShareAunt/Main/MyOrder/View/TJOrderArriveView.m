//
//  TJOrderArriveView.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/26.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJOrderArriveView.h"


@interface TJOrderArriveView ()

@property (nonatomic,weak) UILabel *titleLab;
@property (nonatomic,weak) UIButton *portraitBtn;
@property (nonatomic,weak) UIButton *callBtn;
@property (nonatomic,weak) UIButton *cancelBtn;
@property (nonatomic,weak) UIButton *affirmBtn;
@end
@implementation TJOrderArriveView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    self.backgroundColor = [UIColor redColor];
    __weak typeof(self) weakSelf = self;
    UILabel *titleLab = [UILabel labelWithText:@"您已成功接单，请按要求去往工作地点" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFangSC-Regular" fontSize:14 wordSpace:0];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLab];
    self.titleLab = titleLab;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).offset(50);
        make.centerX.equalTo(weakSelf);
    }];
    
    UIButton *portraitBtn = [UIButton TJ_buttonWithTitle:@"李先生" titleColor:[UIColor blackColor] titleFont:[UIFont systemFontOfSize:14] imageName:@"user" selectImageName:nil backgroundColor:nil];
    [self addSubview:portraitBtn];
    self.portraitBtn = portraitBtn;
    [self.portraitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.right.equalTo(weakSelf.centerX);
        make.size.equalTo(CGSizeMake(110, 48));
    }];
    [portraitBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 13, 0, 0)];
    
    UIButton *callBtn = [UIButton buttonWithTitle:nil imageName:@"call"];
    [self addSubview:callBtn];
    self.callBtn = callBtn;
    [self.callBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.centerX).offset(77);
        make.centerY.equalTo(weakSelf.centerY);
    }];
    
    UIButton *cancelBtn = [UIButton TJ_buttonWithTitle:@"取消订单" titleColor:[UIColor jk_colorWithHex:0x272727] titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:14] backgroundColor:[UIColor whiteColor]];
    cancelBtn.layer.borderWidth = 1;
    cancelBtn.layer.borderColor = [UIColor jk_colorWithHex:0xB5B5B5].CGColor;
    cancelBtn.layer.cornerRadius = 5;
    cancelBtn.layer.masksToBounds = YES;
    [self addSubview:cancelBtn];
    self.cancelBtn = cancelBtn;
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.bottom).offset(-40);
        make.right.equalTo(weakSelf.centerX).offset(-38);
        make.size.equalTo(CGSizeMake(79, 31));
        
    }];
    
    UIButton *affirmBtn = [UIButton TJ_buttonWithTitle:@"确认订单" titleColor:[UIColor whiteColor] titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:14] backgroundColor:MOTIF_BUTTON_COLOR];
    cancelBtn.layer.cornerRadius  = 5;
    cancelBtn.layer.masksToBounds = YES;
    [self addSubview:affirmBtn];
    self.affirmBtn = affirmBtn;
    [self.affirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.bottom).offset(-40);
        make.left.equalTo(weakSelf.centerX).offset(38);
        make.size.equalTo(CGSizeMake(79, 31));
        
    }];
    
}
@end


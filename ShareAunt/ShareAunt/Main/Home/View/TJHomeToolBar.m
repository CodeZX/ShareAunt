//
//  TJHomeToolBar.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/19.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJHomeToolBar.h"




@interface TJHomeToolBar ()

@property (nonatomic,weak) UIButton *modeBtn;
@property (nonatomic,weak) UIButton *receivingrdersBtn;
@property (nonatomic,weak) UILabel *statusLab;
@property (nonatomic,weak) UIButton *acceptTaskBtn;   // 接收订单
@property (nonatomic,weak) UIButton *unAcceptTaskBtn;  // 收单
@end

@implementation TJHomeToolBar


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
    
    UIButton *modeBtn = [UIButton buttonWithTitle:@"模式" imageName:@"set"];
    modeBtn.layer.cornerRadius = 5;
    modeBtn.layer.masksToBounds = YES;
    [modeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    modeBtn.backgroundColor = [UIColor jk_colorWithHex:0x4C4C5A];
    [modeBtn addTarget:self action:@selector(modeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:modeBtn];
    self.modeBtn = modeBtn;
    [self.modeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.centerY.equalTo(weakSelf);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
    [modeBtn jk_setImagePosition:LXMImagePositionTop spacing:5];
    
    
    UIButton *unAcceptTaskBtn = [UIButton buttonWithTitle:@"收单" imageName:@"close"];
    unAcceptTaskBtn.layer.cornerRadius = 5;
    unAcceptTaskBtn.layer.masksToBounds = YES;
    [unAcceptTaskBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    unAcceptTaskBtn.backgroundColor = MOTIF_BUTTON_COLOR;
    [unAcceptTaskBtn addTarget:self action:@selector(unAcceptTaskBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:unAcceptTaskBtn];
    self.unAcceptTaskBtn = unAcceptTaskBtn;
    [self.unAcceptTaskBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-15);
        make.centerY.equalTo(weakSelf);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
    [unAcceptTaskBtn jk_setImagePosition:LXMImagePositionTop spacing:5];
    
    
    
    UILabel *statusLab = [UILabel labelWithText:@"听单" textColor:[UIColor whiteColor] fontName:@"PingFang-SC-Regular" fontSize:24 wordSpace:0];
    [self addSubview:statusLab];
    self.statusLab = statusLab;
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf);
    }];
    
    
    UIButton *acceptTaskBtn = [UIButton buttonWithTitle:@"点击接单" imageName:@""];
    acceptTaskBtn.hidden = YES;
    acceptTaskBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    acceptTaskBtn.layer.cornerRadius = 5;
    acceptTaskBtn.layer.masksToBounds = YES;
    [acceptTaskBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    acceptTaskBtn.backgroundColor = MOTIF_BUTTON_COLOR;
    [acceptTaskBtn addTarget:self action:@selector(acceptTaskBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:acceptTaskBtn];
    self.acceptTaskBtn = acceptTaskBtn;
    [self.acceptTaskBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-20);
        make.left.equalTo(weakSelf.modeBtn.right).offset(30);
        make.top.equalTo(20);
        make.bottom.equalTo(-20);
        
    }];
//    [receivingrdersBtn jk_setImagePosition:LXMImagePositionTop spacing:5];
    
}

- (void)modeBtnClicked:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(homeToolBar:didTapMode:)]) {
        [self.delegate homeToolBar:self didTapMode:btn];
    }
    
}

- (void)unAcceptTaskBtnClicked:(UIButton *)btn {
    
    self.unAcceptTaskBtn.hidden = YES;
    self.acceptTaskBtn.hidden = NO;
    self.statusLab.hidden = YES;
    if ([self.delegate respondsToSelector:@selector(homeToolBar:didTapUnacceptTask:)]) {
        [self.delegate homeToolBar:self didTapUnacceptTask:btn];
    }
    
}

- (void)acceptTaskBtnClicked:(UIButton *)btn {
    
    self.unAcceptTaskBtn.hidden = NO;
    self.statusLab.hidden = NO;
    self.acceptTaskBtn.hidden = YES;
    if ([self.delegate respondsToSelector:@selector(homeToolBar:didTapAcceptTask:)]) {
        [self.delegate homeToolBar:self didTapAcceptTask:btn];
    }
    
}
@end

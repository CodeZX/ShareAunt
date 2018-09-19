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
    
    
    UIButton *receivingrdersBtn = [UIButton buttonWithTitle:@"收单" imageName:@"close"];
    receivingrdersBtn.layer.cornerRadius = 5;
    receivingrdersBtn.layer.masksToBounds = YES;
    [receivingrdersBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    receivingrdersBtn.backgroundColor = MOTIF_BUTTON_COLOR;
    [receivingrdersBtn addTarget:self action:@selector(receivingrdersBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:receivingrdersBtn];
    self.receivingrdersBtn = receivingrdersBtn;
    [self.receivingrdersBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-15);
        make.centerY.equalTo(weakSelf);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
    [receivingrdersBtn jk_setImagePosition:LXMImagePositionTop spacing:5];
    
    
    
    UILabel *statusLab = [UILabel labelWithText:@"听单" textColor:[UIColor whiteColor] fontName:@"PingFang-SC-Regular" fontSize:24 wordSpace:0];
    [self addSubview:statusLab];
    self.statusLab = statusLab;
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf);
    }];
    
}

- (void)modeBtnClicked:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(homeToolBar:didTapMode:)]) {
        [self.delegate homeToolBar:self didTapMode:btn];
    }
    
}

- (void)receivingrdersBtnClicked:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(homeToolBar:didTapReceivingrders:)]) {
        [self.delegate homeToolBar:self didTapReceivingrders:btn];
    }
    
}
@end

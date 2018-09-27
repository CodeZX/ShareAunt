//
//  TJUserCenterheaderView.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJUserCenterHeaderView.h"


@interface TJUserCenterHeaderView ()

@property (nonatomic,weak) UIImageView *portraitImaV;
@property (nonatomic,weak) UIImageView *gradeImaV;
@property (nonatomic,weak) UILabel *gradelab;
@property (nonatomic,weak) UILabel *nameLab;
@property (nonatomic,weak) UILabel *statusLab;
@property (nonatomic,weak) UILabel *authenticationStatusLab;

@end

@implementation TJUserCenterHeaderView

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
    
    UIImageView *portraitImaV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user"]];
    portraitImaV.userInteractionEnabled = YES;
    portraitImaV.layer.cornerRadius = 75/2.0;
    portraitImaV.layer.masksToBounds = YES;
    [self addSubview:portraitImaV];
    self.portraitImaV = portraitImaV;
    [self.portraitImaV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(27);
        make.top.equalTo(weakSelf).offset(10);
        make.size.equalTo(CGSizeMake(75, 75));
    }];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(portraitImaVTap:)];
    [portraitImaV addGestureRecognizer:tapGesture];
    
    
    UIImageView *gradeImaV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"星级"]];
//    gradeImaV.layer.cornerRadius = 75/2.0;
//    gradeImaV.layer.masksToBounds = YES;
    [self addSubview:gradeImaV];
    self.gradeImaV = gradeImaV;
    [self.gradeImaV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.portraitImaV);
        make.top.equalTo(weakSelf.portraitImaV.bottom).offset(-5);
        make.size.equalTo(CGSizeMake(45, 20));
    }];
    
    UILabel *gradelab = [UILabel labelWithText:@"4.9" textColor:[UIColor jk_colorWithHex:0xF6D600] fontName:@"PingFang-SC-Medium" fontSize:12 wordSpace:4];
    
    
    
    UILabel *nameLab = [UILabel labelWithText:@"张三" textColor:[UIColor whiteColor] fontName:@"PingFang-SC-Medium" fontSize:18 wordSpace:4];
    [self addSubview:nameLab];
    self.nameLab = nameLab;
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.portraitImaV.right).offset(15);
        make.centerY.equalTo(weakSelf.portraitImaV);
    }];
    
    
    UILabel *statusLab = [UILabel labelWithText:@"空闲" textColor:[UIColor whiteColor] fontName:@"PingFang-SC-Medium" fontSize:15 wordSpace:4];
    [self addSubview:statusLab];
    self.statusLab = statusLab;
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nameLab.right).offset(22);
        make.centerY.equalTo(weakSelf.nameLab);
    }];
    
    UILabel *authenticationStatusLab = [UILabel labelWithText:@"已认证" textColor:[UIColor jk_colorWithHex:0xFF8200] fontName:@"PingFang-SC-Medium" fontSize:16 wordSpace:4];
    [self addSubview:authenticationStatusLab];
    self.authenticationStatusLab = authenticationStatusLab;
    [self.authenticationStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.right).offset(-68);
        make.centerY.equalTo(weakSelf.nameLab);
    }];
    
    [self setupmenuView];
    
    
}
- (void)setupmenuView {
    
     __weak typeof(self) weakSelf = self;
    UIView *menuView = [[UIView alloc]init];
    menuView.backgroundColor = [UIColor whiteColor];
    [self addSubview:menuView];
    [menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf);
        make.height.equalTo(menuView.width).multipliedBy(SCALE_H(375, 100));
    }];
    
    UIButton *walletBtn = [UIButton buttonWithTitle:@"我的钱包" imageName:@"wallet-1"];
//    walletBtn.backgroundColor = [UIColor redColor];
    walletBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [walletBtn addTarget:self action:@selector(walletBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:walletBtn];
    [walletBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(menuView);
        make.left.equalTo(menuView.left).offset(20);
//        make.size.equalTo(CGSizeMake(100,20));
        make.height.equalTo(58);
    }];
    [walletBtn jk_setImagePosition:(LXMImagePositionTop) spacing:5];
    
    
    
    
    
    UIButton *orderBtn = [UIButton buttonWithTitle:@"我的订单" imageName:@"order-1"];
    //    walletBtn.backgroundColor = [UIColor redColor];
    orderBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //    walletBtn.imageView.frame = CGRectMake(0, 0, 56, 56);
    [orderBtn addTarget:self action:@selector(orderBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:orderBtn];
    [orderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(menuView);
      
        //        make.size.equalTo(CGSizeMake(80,80));
    }];
    [orderBtn jk_setImagePosition:(LXMImagePositionTop) spacing:5];
    
    UIButton *integralBtn = [UIButton buttonWithTitle:@"我的积分" imageName:@"integral-1"];
//    integralBtn.backgroundColor = [UIColor redColor];
    integralBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //    walletBtn.imageView.frame = CGRectMake(0, 0, 56, 56);
    [menuView addSubview:integralBtn];
    [integralBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(menuView);
        make.right.equalTo(menuView).offset(-20);
    }];
    [integralBtn jk_setImagePosition:(LXMImagePositionTop) spacing:5];
    
    
    UIView *colorBar = [[UIView alloc]init];
    colorBar.backgroundColor = [UIColor jk_colorWithHex:0xEFEFEF];
    [self addSubview:colorBar];
    [colorBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(weakSelf);
        make.height.equalTo(22);
    }];
    
}


- (void)portraitImaVTap:(UITapGestureRecognizer *)tap {
    
    if ([self.delegate respondsToSelector:@selector(userCenterHeaderView:didPortraitClicked:)]) {
        [self.delegate userCenterHeaderView:self didPortraitClicked:self.portraitImaV];
    }
}

- (void)orderBtnClicked:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(userCenterHeaderView:didOrderClicked:)]) {
        [self.delegate userCenterHeaderView:self didOrderClicked:btn];
    }

}

- (void)walletBtnClicked:(UIButton *)btn  {
    if ([self.delegate respondsToSelector:@selector(userCenterHeaderView:didWalletClicked:)]) {
        [self.delegate userCenterHeaderView:self didWalletClicked:btn];
    }
}
@end

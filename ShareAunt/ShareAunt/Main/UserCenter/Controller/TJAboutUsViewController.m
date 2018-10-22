//
//  TJAboutUsViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/10/11.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJAboutUsViewController.h"

@interface TJAboutUsViewController ()

@property (nonatomic,weak) UILabel *contentLab;
@property (nonatomic,weak) UIImageView *logoImageV;
@property (nonatomic,weak) UILabel *titleLab;
@property (nonatomic,weak) UILabel *versionNumberLab;
@end

@implementation TJAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"关于我们";
    __weak typeof(self) weakSelf = self;
    
    UIImageView *logoImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login-icon"]];
    [self.view addSubview:logoImageV];
    self.logoImageV = logoImageV;
    [self.logoImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).offset(iPhoneX?104:84);
        //        make.size.equalTo(CGSizeMake(102, 122));
        make.left.equalTo(weakSelf.view).offset(SCREEN_WIDTH * SCALE_X(137));
        make.right.equalTo(weakSelf.view).offset(-SCREEN_WIDTH * SCALE_X(137));
        make.height.equalTo(weakSelf.logoImageV.width).multipliedBy(SCALE_H(102, 122));
    }];
    
    UILabel *titleLab = [UILabel labelWithText:@"共享阿姨" textColor:[UIColor jk_colorWithHex:0x3F3A39] fontName:@"PingFang-SC-Medium" fontSize:15 wordSpace:5];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLab];
    self.titleLab = titleLab;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.logoImageV.bottom).offset(15);
        make.centerX.equalTo(weakSelf.view);
    }];
    
    UILabel *versionNumberLab = [UILabel labelWithText:@"1.0版" textColor:[UIColor jk_colorWithHex:0xFF8200] fontName:@"PingFang-SC-Medium" fontSize:12 wordSpace:5];
    versionNumberLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:versionNumberLab];
    self.versionNumberLab = versionNumberLab;
    [self.versionNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLab.bottom).offset(5);
        make.centerX.equalTo(weakSelf.view);
    }];
    
    UILabel *contentLab = [UILabel labelWithText:@"共享阿姨平台上线，免押金，方便 接单，为您提供便利。" textColor:[UIColor jk_colorWithHex:0x999999] fontName:@"PingFang-SC-Medium" fontSize:12 wordSpace:0];
    contentLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:contentLab];
    self.contentLab = contentLab;
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        
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

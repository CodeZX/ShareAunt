//
//  TJInputVerificationCodeViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/11.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJInputVerificationCodeViewController.h"
#import "TJResetPasswordViewController.h"
#import "TJPasswordTextFeld.h"

@interface TJInputVerificationCodeViewController ()
@property (nonatomic,weak) UITextField *verificationCodeTF;
@property (nonatomic,weak) UIButton *confirmBtn;
@end

@implementation TJInputVerificationCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupUI];
}


- (void)setupUI {
    
    self.title = @"输入验证码";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.font = [UIFont systemFontOfSize:18];
    titleLab.text = @"已发送验证码至";
    [self.view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).offset(56);
    }];
    
    UILabel *phoneNumberLab = [[UILabel alloc]init];
    phoneNumberLab.font = [UIFont systemFontOfSize:18];
    phoneNumberLab.text = @"1234567890";
    [self.view addSubview:phoneNumberLab];
    [phoneNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(titleLab.bottom).offset(30);
    }];
    
    
    TJPasswordTextFeld *verificationCodeTF = [[TJPasswordTextFeld alloc]init];
    [self.view addSubview:verificationCodeTF];
    self.verificationCodeTF = verificationCodeTF;
    
//    UITextField *verificationCodeTF = [[UITextField alloc]init];
//    verificationCodeTF.secureTextEntry = YES;
//    //    phoneNumberTF.textAlignment = NSTextAlignmentCenter;
//    verificationCodeTF.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
//    verificationCodeTF.layer.borderWidth = 1;
//    verificationCodeTF.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
//    verificationCodeTF.adjustsFontSizeToFitWidth = YES;
//    verificationCodeTF.keyboardType = UIKeyboardTypeDefault;
//    verificationCodeTF.returnKeyType = UIReturnKeyNext;
//    verificationCodeTF.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my"]];
//    verificationCodeTF.leftViewMode = UITextFieldViewModeAlways;
//    verificationCodeTF.placeholder = @"请输入验证码";
//    verificationCodeTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
//    [self.view addSubview:verificationCodeTF];
//    self.verificationCodeTF = verificationCodeTF;
    [self.verificationCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneNumberLab.bottom).offset(30);
        make.centerX.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(30);
        make.right.equalTo(weakSelf.view).offset(-30);
        make.height.equalTo(60);
    }];
    
    
    UIButton *confirmBtn = [[UIButton alloc]init];
    confirmBtn.backgroundColor = MOTIF_BUTTON_COLOR;
    confirmBtn.layer.cornerRadius = 5;
    confirmBtn.layer.masksToBounds = YES;
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    self.confirmBtn = confirmBtn;
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.verificationCodeTF.bottom).offset(30);
        make.centerX.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(62);
        make.right.equalTo(weakSelf.view).offset(-62);
        make.height.equalTo(50);
    }];
    
}

- (void)confirmBtnClicked:(UIButton *)btn {
    
    TJResetPasswordViewController *VC = [[TJResetPasswordViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end

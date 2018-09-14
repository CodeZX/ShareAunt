//
//  TJResetPasswordViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/11.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJResetPasswordViewController.h"

@interface TJResetPasswordViewController ()
@property (nonatomic,weak) UITextField *phoneNumberTF;
@property (nonatomic,weak) UITextField *passwordTF;
@property (nonatomic,weak) UIButton *confirmBtn;
@end

@implementation TJResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
    self.title = @"重置密码";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;

   
    UITextField *phoneNumberTF = [[UITextField alloc]init];
    //    phoneNumberTF.textAlignment = NSTextAlignmentCenter;
//    phoneNumberTF.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
//    phoneNumberTF.layer.borderWidth = 1;
    phoneNumberTF.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
    phoneNumberTF.adjustsFontSizeToFitWidth = YES;
    phoneNumberTF.keyboardType = UIKeyboardTypeDefault;
    phoneNumberTF.returnKeyType = UIReturnKeyNext;
    phoneNumberTF.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my"]];
    phoneNumberTF.leftViewMode = UITextFieldViewModeAlways;
    phoneNumberTF.placeholder = @"请输入手机号码";
    phoneNumberTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:phoneNumberTF];
    self.phoneNumberTF = phoneNumberTF;
    [self.phoneNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(50);
        make.centerX.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(30);
        make.right.equalTo(weakSelf.view).offset(-30);
        make.height.equalTo(56);
    }];
    
    UIView *lineView0 = [[UIView alloc]init];
    lineView0.backgroundColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:lineView0];
    [lineView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneNumberTF.bottom);
        make.left.right.equalTo(phoneNumberTF);
        make.height.equalTo(1);
    }];
    
    
    UITextField *passwordTF = [[UITextField alloc]init];
    //    phoneNumberTF.textAlignment = NSTextAlignmentCenter;
//    passwordTF.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
//    passwordTF.layer.borderWidth = 1;
    passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
    passwordTF.adjustsFontSizeToFitWidth = YES;
    passwordTF.keyboardType = UIKeyboardTypeDefault;
    passwordTF.returnKeyType = UIReturnKeyNext;
    passwordTF.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my"]];
    passwordTF.leftViewMode = UITextFieldViewModeAlways;
    passwordTF.placeholder = @"请输入密码";
    passwordTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:passwordTF];
    self.passwordTF = passwordTF;
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.phoneNumberTF.bottom).offset(-1);
        make.centerX.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(30);
        make.right.equalTo(weakSelf.view).offset(-30);
        make.height.equalTo(56);
    }];
    
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordTF.bottom);
        make.left.right.equalTo(passwordTF);
        make.height.equalTo(1);
    }];
    
    UIButton *confirmBtn = [[UIButton alloc]init];
    confirmBtn.backgroundColor = MOTIF_BUTTON_COLOR;
    confirmBtn.layer.cornerRadius = 5;
    confirmBtn.layer.masksToBounds = YES;
    [confirmBtn setTitle:@"注册" forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    self.confirmBtn = confirmBtn;
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.passwordTF.bottom).offset(30);
        make.centerX.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(62);
        make.right.equalTo(weakSelf.view).offset(-62);
        make.height.equalTo(50);
    }];

}



- (void)confirmBtnClicked:(UIButton *)btn {
    
}




@end

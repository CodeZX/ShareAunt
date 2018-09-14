//
//  TJSigninViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/10.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJSigninViewController.h"
#import "TJVerificationCodeButton.h"

@interface TJSigninViewController ()

@property (nonatomic,weak) UIImageView *logoImageV;
@property (nonatomic,weak) UILabel *titleLab;
@property (nonatomic,weak) UIView *inputView;
@property (nonatomic,weak) UITextField *phoneNumberTF;
@property (nonatomic,weak) UITextField *verificationCodeTF;
@property (nonatomic,weak) UITextField *passwordTF;
@property (nonatomic,weak) UIButton *logInBtn;
@property (nonatomic,weak) UIButton *forgetPasswordBtn;
@property (nonatomic,weak) UIButton *signInBtn;
@end

@implementation TJSigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
    self.title = @"注册";
    self.view.backgroundColor = WhiteColor;
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
    
    UILabel *titleLab = [UILabel labelWithText:@"共享阿姨" textColor:[UIColor jk_colorWithHex:0x3F3A39] fontName:@"PingFang-SC-Medium" fontSize:25 wordSpace:5];
    [self.view addSubview:titleLab];
    self.titleLab = titleLab;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.logoImageV.bottom).offset(20);
        make.centerX.equalTo(weakSelf.view);
    }];
    
    [self setupInputView];
    

    
    UIButton *signInBtn = [[UIButton alloc]init];
    signInBtn.backgroundColor = MOTIF_BUTTON_COLOR;
    signInBtn.layer.cornerRadius = 5;
    signInBtn.layer.masksToBounds = YES;
    [signInBtn setTitle:@"注册" forState:UIControlStateNormal];
    [signInBtn addTarget:self action:@selector(signInBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signInBtn];
    self.signInBtn = signInBtn;
    [self.signInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.inputView.bottom).offset(30);
        make.centerX.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(62);
        make.right.equalTo(weakSelf.view).offset(-62);
        make.height.equalTo(50);
    }];
    
    

    
}

- (void)setupInputView {
    
    __weak typeof(self) weakSelf = self;
    UIView *inputView = [[UIView alloc]init];
    //    inputView.backgroundColor = [UIColor redColor];
    inputView.layer.cornerRadius = 5;
    inputView.layer.masksToBounds = YES;
    inputView.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
    inputView.layer.borderWidth = 1;
    [self.view addSubview:inputView];
    self.inputView = inputView;
    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(SCREEN_HEIGHT * SCALE_Y(289));
        make.left.equalTo(weakSelf.view).offset(30);
        make.right.equalTo(weakSelf.view).offset(-30);
        make.height.equalTo(weakSelf.inputView.width).multipliedBy(SCALE_H(315, 169));
    }];
    
    
    UITextField *phoneNumberTF = [[UITextField alloc]init];
    //    phoneNumberTF.textAlignment = NSTextAlignmentCenter;
    //    phoneNumberTF.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
    //    phoneNumberTF.layer.borderWidth = 1;
    //    phoneNumberTF.layer.cornerRadius = 5;
    //    phoneNumberTF.layer.masksToBounds = YES;
    phoneNumberTF.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
    phoneNumberTF.adjustsFontSizeToFitWidth = YES;
    phoneNumberTF.keyboardType = UIKeyboardTypeDefault;
    phoneNumberTF.returnKeyType = UIReturnKeyNext;
    phoneNumberTF.leftView = [self setleftViewWithName:@"icon_user"];
    phoneNumberTF.leftViewMode = UITextFieldViewModeAlways;
    phoneNumberTF.placeholder = @"请输入手机号码";
    phoneNumberTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.inputView addSubview:phoneNumberTF];
    self.phoneNumberTF = phoneNumberTF;
    [self.phoneNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.inputView);
        make.centerX.equalTo(weakSelf.inputView);
        make.left.equalTo(weakSelf.inputView);
        make.right.equalTo(weakSelf.inputView);
        make.height.equalTo(56);
    }];
    
   
    
    
    TJVerificationCodeButton *verificationCodeBtn = [[TJVerificationCodeButton alloc]initWithFrame:CGRectMake(0, 0, 100, 56)];
    //    verificationCodeBtn.backgroundColor = [UIColor redColor];
    //    forgetPasswordBtn.backgroundColor = MOTIF_BUTTON_COLOR;
    [verificationCodeBtn setTitleColor:MOTIF_BUTTON_COLOR forState:UIControlStateNormal];
    verificationCodeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    verificationCodeBtn.layer.cornerRadius = 5;
    verificationCodeBtn.layer.masksToBounds = YES;
    [verificationCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [verificationCodeBtn addTarget:self action:@selector(verificationCodeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.phoneNumberTF.rightView = verificationCodeBtn;
    self.phoneNumberTF.rightViewMode = UITextFieldViewModeAlways;
    //        self.forgetPasswordBtn = forgetPasswordBtn;
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.inputView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.phoneNumberTF.bottom);
        make.left.right.equalTo(weakSelf.inputView);
        make.height.equalTo(1);
    }];
    
    
    UITextField *verificationCodeTF = [[UITextField alloc]init];
    //    phoneNumberTF.textAlignment = NSTextAlignmentCenter;
//    verificationCodeTF.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
//    verificationCodeTF.layer.borderWidth = 1;
    verificationCodeTF.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
    verificationCodeTF.adjustsFontSizeToFitWidth = YES;
    verificationCodeTF.keyboardType = UIKeyboardTypeDefault;
    verificationCodeTF.returnKeyType = UIReturnKeyNext;
    verificationCodeTF.leftView = [self setleftViewWithName:@"icon_password"];
    verificationCodeTF.leftViewMode = UITextFieldViewModeAlways;
    verificationCodeTF.placeholder = @"请输入验证码";
    verificationCodeTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:verificationCodeTF];
    self.verificationCodeTF = verificationCodeTF;
    [self.verificationCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.phoneNumberTF.bottom);
        make.centerX.equalTo(weakSelf.inputView);
        make.left.equalTo(weakSelf.inputView);
        make.right.equalTo(weakSelf.inputView);
        make.height.equalTo(56);
    }];
    
    
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.inputView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.verificationCodeTF.bottom);
        make.left.right.equalTo(weakSelf.inputView);
        make.height.equalTo(1);
    }];
    
    
    UITextField *passwordTF = [[UITextField alloc]init];
    //    phoneNumberTF.textAlignment = NSTextAlignmentCenter;
    //    passwordTF.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
    //    passwordTF.layer.borderWidth = 1;
    //    passwordTF.layer.cornerRadius = 5;
    //    passwordTF.layer.masksToBounds = YES;
    passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
    passwordTF.adjustsFontSizeToFitWidth = YES;
    passwordTF.keyboardType = UIKeyboardTypeDefault;
    passwordTF.returnKeyType = UIReturnKeyNext;
    passwordTF.leftView = [self setleftViewWithName:@"icon_password"];
    passwordTF.leftViewMode = UITextFieldViewModeAlways;
    passwordTF.placeholder = @"请输入密码";
    passwordTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.inputView addSubview:passwordTF];
    self.passwordTF = passwordTF;
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.verificationCodeTF.bottom);
        make.centerX.equalTo(weakSelf.inputView);
        make.left.equalTo(weakSelf.inputView);
        make.right.equalTo(weakSelf.inputView);
        make.height.equalTo(56);
    }];
    
    
    
}

- (UIView *)setleftViewWithName:(NSString *)name {
    
    UIView *leftView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 66, 56)];
    UIImageView *leftImagv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 17, 17)];
    leftImagv.image = [UIImage imageNamed:name];
    [leftView addSubview:leftImagv];
    [leftImagv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(leftView);
    }];
    return leftView;
}

- (void)signInBtnClicked:(UIButton *)btn {
    
    
}

- (void)verificationCodeBtnClicked:(TJVerificationCodeButton *)btn {
    
    [btn timeFailBeginFrom:60];
}

@end

//
//  TJLogInViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/10.
//  Copyright © 2018年 TJ. All rights reserved.
//   登录

#import "TJLogInViewController.h"
#import "TJForgetPasswordViewController.h"
#import "TJSigninViewController.h"
#import "TJUserCenterViewController.h"

@interface TJLogInViewController ()

@property (nonatomic,weak) UIImageView *logoImageV;
@property (nonatomic,weak) UILabel *titleLab;
@property (nonatomic,weak) UIView *inputView;
@property (nonatomic,weak) UITextField *phoneNumberTF;
@property (nonatomic,weak) UITextField *passwordTF;
@property (nonatomic,weak) UIButton *logInBtn;
@property (nonatomic,weak) UIButton *forgetPasswordBtn;
@property (nonatomic,weak) UIButton *signInBtn;

@end

@implementation TJLogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
     self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
   
}




- (void)setupUI {
    
    self.title = @"登录";
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
   
    
   
    
    UIButton *logInBtn = [[UIButton alloc]init];
    logInBtn.backgroundColor = MOTIF_BUTTON_COLOR;
    logInBtn.layer.cornerRadius = 5;
    logInBtn.layer.masksToBounds = YES;
    [logInBtn setTitle:@"登录" forState:UIControlStateNormal];
    [logInBtn addTarget:self action:@selector(logInBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logInBtn];
    self.logInBtn = logInBtn;
    [self.logInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.passwordTF.bottom).offset(30);
        make.centerX.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(62);
        make.right.equalTo(weakSelf.view).offset(-62);
        make.height.equalTo(50);
    }];
    
    
    UIButton *forgetPasswordBtn = [[UIButton alloc]init];
//    forgetPasswordBtn.backgroundColor = MOTIF_BUTTON_COLOR;
    [forgetPasswordBtn setTitleColor:MOTIF_BUTTON_COLOR forState:UIControlStateNormal];
    forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    forgetPasswordBtn.layer.cornerRadius = 5;
    forgetPasswordBtn.layer.masksToBounds = YES;
    [forgetPasswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPasswordBtn addTarget:self action:@selector(forgetPasswordBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPasswordBtn];
    self.forgetPasswordBtn = forgetPasswordBtn;
    [self.forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.logInBtn.bottom).offset(10);
        make.left.equalTo(weakSelf.logInBtn.left).offset(-20);
        make.height.equalTo(50);
    }];
    
    UIButton *signInBtn = [[UIButton alloc]init];
    //    forgetPasswordBtn.backgroundColor = MOTIF_BUTTON_COLOR;
    [signInBtn setTitleColor:MOTIF_BUTTON_COLOR forState:UIControlStateNormal];
    signInBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    signInBtn.layer.cornerRadius = 5;
    signInBtn.layer.masksToBounds = YES;
    [signInBtn setTitle:@"没有账号？点击注册" forState:UIControlStateNormal];
    [signInBtn addTarget:self action:@selector(signInBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signInBtn];
    self.signInBtn = signInBtn;
    [self.signInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.logInBtn.bottom).offset(10);
        make.right.equalTo(weakSelf.logInBtn.right).offset(20);
        make.height.equalTo(50);
    }];
    
}

- (void)setupInputView {
    
//    DEBUG_LOG(@"SCALE_Y%f",287/667.0);
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
        make.height.equalTo(weakSelf.inputView.width).multipliedBy(SCALE_H(315, 112));
    }];
    
    
    UITextField *phoneNumberTF = [[UITextField alloc]init];
    //    phoneNumberTF.textAlignment = NSTextAlignmentCenter;
//    phoneNumberTF.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
//    phoneNumberTF.layer.borderWidth = 1;
    //    phoneNumberTF.layer.cornerRadius = 5;
    //    phoneNumberTF.layer.masksToBounds = YES;
    phoneNumberTF.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
    phoneNumberTF.adjustsFontSizeToFitWidth = YES;
    phoneNumberTF.keyboardType = UIKeyboardTypeNumberPad;
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
        make.height.equalTo(weakSelf.phoneNumberTF.width).multipliedBy(SCALE_H(315, 56));
    }];
    
    
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.inputView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.phoneNumberTF.bottom);
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
        make.top.equalTo(weakSelf.phoneNumberTF.bottom);
        make.centerX.equalTo(weakSelf.inputView);
        make.left.equalTo(weakSelf.inputView);
        make.right.equalTo(weakSelf.inputView);
        make.height.equalTo(weakSelf.passwordTF.width).multipliedBy(SCALE_H(315, 56));
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
#pragma mark -------------------------- Respond Means ----------------------------------------

- (void)logInBtnClicked:(UIButton *)btn {
    
//    TJUserCenterViewController *VC = [[TJUserCenterViewController alloc]init];
//    [self.navigationController pushViewController:VC animated:YES];
    
    NSDictionary *parametersDic =  @{@"aunt_phone":self.phoneNumberTF.text,
                                    @"aunt_pwd":self.passwordTF.text
                                    };
    __weak typeof(self) weakSelf = self;
    [MBProgressHUD showMessage:@"登录中.."];
    [[TJNetworking manager] post:kLoginURL parameters:parametersDic progress:nil success:^(TJNetworkingSuccessResponse * _Nonnull response) {
        
        [MBProgressHUD hideHUD];
        if ([response.responseObject[@"code"] intValue] == 200) {
            
            userModel *user = [userModel mj_objectWithKeyValues:[response.responseObject[@"result"] firstObject]];
            user.pasword = self.passwordTF.text;
            user.logInType = LogInTypepasword;
            [[UsersManager sharedUsersManager] loginWithUser:user];
            [weakSelf getUserInfo];
           
        }else {
            [MBProgressHUD showSuccess:response.responseObject[@"message"]];
        }
        
        
    } failed:^(TJNetworkingFailureResponse * _Nonnull response) {
        [MBProgressHUD hideHUD];
        [MBProgressHUD showSuccess:@"登录失败"];
    } finished:^{
        
        //        [MBProgressHUD hideHUD];
        
    }];
    
}


- (void)getUserInfo {
    
    __weak typeof(self) weakSelf = self;
    NSDictionary *parametersDic = @{@"aunt_id":[UsersManager sharedUsersManager].currentUser.aunt_id,
                                    @"token":[UsersManager sharedUsersManager].currentUser.token
                                    };
    [[TJNetworking manager] post:kPersonalURL parameters:parametersDic progress:nil success:^(TJNetworkingSuccessResponse * _Nonnull response) {
        
        if ([response.responseObject[@"code"] intValue] == 200) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"登录成功"];
            userModel *user = [userModel mj_objectWithKeyValues:[response.responseObject[@"result"] lastObject]];
            user.pasword = [UsersManager sharedUsersManager].currentUser.pasword;
            user.token = [UsersManager sharedUsersManager].currentUser.token;
            [[UsersManager sharedUsersManager] loginWithUser:user];
            
            
             [weakSelf performSelector:@selector(backAction) withObject:nil afterDelay:0.5];
        }
        
    } failed:^(TJNetworkingFailureResponse * _Nonnull response) {
        [MBProgressHUD hideHUD];
        [MBProgressHUD showSuccess:@"登录失败"];
    } finished:^{
        
    }];
}

- (void)backAction {
    
    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)forgetPasswordBtnClicked:(UIButton *)btn {
    
    TJForgetPasswordViewController *forgetPasswordVC = [[ TJForgetPasswordViewController alloc]init];
    [self.navigationController pushViewController:forgetPasswordVC animated:YES];
    
}

- (void)signInBtnClicked:(UIButton *)btn {
    
    TJSigninViewController *VC = [[TJSigninViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}



@end

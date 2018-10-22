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
#import "AppDelegate.h"

@interface TJInputVerificationCodeViewController ()
@property (nonatomic,weak) UITextField *verificationCodeTF;
@property (nonatomic,weak) UIButton *confirmBtn;
@property (nonatomic,strong) NSString *phoneNumber;
@end

@implementation TJInputVerificationCodeViewController

- (instancetype)initWithPhoneNumber:(NSString *)phoneNumber {
    self = [super init];
    if (self) {
        self.phoneNumber = phoneNumber;
    }
    return self;
}

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
    phoneNumberLab.text = self.phoneNumber?self.phoneNumber:@"无效号码";
    [self.view addSubview:phoneNumberLab];
    [phoneNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(titleLab.bottom).offset(10);
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
    
    __weak typeof(self) weakSelf = self;
    NSDictionary *parametersDic = @{   @"user_phone":self.phoneNumber,
                                    @"smsCode":self.verificationCodeTF.text
                                    
                                    };
    [MBProgressHUD showMessage:@"登录中..."];
    [[TJNetworking manager] post:kLoginSmsURL parameters:parametersDic progress:nil success:^(TJNetworkingSuccessResponse * _Nonnull response) {
        [MBProgressHUD hideHUD];
        if ([response.responseObject[@"code"] intValue] == 200) {
            [MBProgressHUD showSuccess:@"登录成功"];
            userModel *user = [userModel mj_objectWithKeyValues:[response.responseObject[@"result"] lastObject] ];
            user.logInType = LogInTypeSms;
            [[UsersManager sharedUsersManager] loginWithUser:user];
            [weakSelf performSelector:@selector(goBack) withObject:nil afterDelay:0.5];
        }else {
            [MBProgressHUD showSuccess:response.responseObject[@"msg"]];
        }
        
    } failed:^(TJNetworkingFailureResponse * _Nonnull response) {
    [MBProgressHUD hideHUD];[MBProgressHUD showSuccess:@"登录失败"];
    } finished:^{
        
    }];
    

}

- (void)goBack {
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app TJ_gotoHomePage];
}

@end

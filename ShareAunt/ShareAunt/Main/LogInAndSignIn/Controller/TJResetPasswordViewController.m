//
//  TJResetPasswordViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/11.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJResetPasswordViewController.h"

@interface TJResetPasswordViewController ()
@property (nonatomic,weak) UITextField *oldPasswordTF;
@property (nonatomic,weak) UITextField *freshPasswordTF;
@property (nonatomic,weak) UITextField *affirmPasswordTF;
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

    UITextField *oldPasswordTF = [[UITextField alloc]init];
    //    phoneNumberTF.textAlignment = NSTextAlignmentCenter;
    //    phoneNumberTF.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
    //    phoneNumberTF.layer.borderWidth = 1;
    oldPasswordTF.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
    oldPasswordTF.adjustsFontSizeToFitWidth = YES;
    oldPasswordTF.keyboardType = UIKeyboardTypeDefault;
    oldPasswordTF.returnKeyType = UIReturnKeyNext;
    oldPasswordTF.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my"]];
    oldPasswordTF.leftViewMode = UITextFieldViewModeAlways;
    oldPasswordTF.placeholder = @"输入旧密码";
    oldPasswordTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:oldPasswordTF];
    self.oldPasswordTF = oldPasswordTF;
    [self.oldPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(50);
        make.centerX.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(30);
        make.right.equalTo(weakSelf.view).offset(-30);
        make.height.equalTo(56);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oldPasswordTF.bottom);
        make.left.right.equalTo(oldPasswordTF);
        make.height.equalTo(1);
    }];
   
    UITextField *freshPasswordTF = [[UITextField alloc]init];
    //    phoneNumberTF.textAlignment = NSTextAlignmentCenter;
//    phoneNumberTF.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
//    phoneNumberTF.layer.borderWidth = 1;
    freshPasswordTF.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
    freshPasswordTF.adjustsFontSizeToFitWidth = YES;
    freshPasswordTF.keyboardType = UIKeyboardTypeDefault;
    freshPasswordTF.returnKeyType = UIReturnKeyNext;
    freshPasswordTF.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my"]];
    freshPasswordTF.leftViewMode = UITextFieldViewModeAlways;
    freshPasswordTF.placeholder = @"输入新密码";
    freshPasswordTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:freshPasswordTF];
    self.freshPasswordTF = freshPasswordTF;
    [self.freshPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.oldPasswordTF.bottom).offset(-1);
        make.centerX.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(30);
        make.right.equalTo(weakSelf.view).offset(-30);
        make.height.equalTo(56);
    }];
    
    UIView *lineView0 = [[UIView alloc]init];
    lineView0.backgroundColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:lineView0];
    [lineView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(freshPasswordTF.bottom);
        make.left.right.equalTo(freshPasswordTF);
        make.height.equalTo(1);
    }];
    
    
    UITextField *affirmPasswordTF = [[UITextField alloc]init];
    //    phoneNumberTF.textAlignment = NSTextAlignmentCenter;
//    passwordTF.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
//    passwordTF.layer.borderWidth = 1;
    affirmPasswordTF.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
    affirmPasswordTF.adjustsFontSizeToFitWidth = YES;
    affirmPasswordTF.keyboardType = UIKeyboardTypeDefault;
    affirmPasswordTF.returnKeyType = UIReturnKeyNext;
    affirmPasswordTF.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my"]];
    affirmPasswordTF.leftViewMode = UITextFieldViewModeAlways;
    affirmPasswordTF.placeholder = @"再次输入密码";
    affirmPasswordTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:affirmPasswordTF];
    self.affirmPasswordTF = affirmPasswordTF;
    [self.affirmPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.freshPasswordTF.bottom).offset(-1);
        make.centerX.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(30);
        make.right.equalTo(weakSelf.view).offset(-30);
        make.height.equalTo(56);
    }];
    
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(affirmPasswordTF.bottom);
        make.left.right.equalTo(affirmPasswordTF);
        make.height.equalTo(1);
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
        make.top.equalTo(weakSelf.affirmPasswordTF.bottom).offset(30);
        make.centerX.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(62);
        make.right.equalTo(weakSelf.view).offset(-62);
        make.height.equalTo(50);
    }];

}



- (void)confirmBtnClicked:(UIButton *)btn {
 
    if (self.oldPasswordTF.text.length == 0) {
        [MBProgressHUD showSuccess:@"请输入旧密码"];
        return;
    }
    if (self.freshPasswordTF.text.length == 0) {
        [MBProgressHUD showSuccess:@"请输入新密码"];
        return;
    }
    if (self.affirmPasswordTF.text.length == 0) {
        [MBProgressHUD showSuccess:@"请输入确认密码"];
        return;
    }
    
    if (![self.affirmPasswordTF.text isEqualToString:self.freshPasswordTF.text]) {
        [MBProgressHUD showSuccess:@"新密码不一致,重新输入"];
        return;
    }
    
    if ([self.affirmPasswordTF.text isEqualToString:self.freshPasswordTF.text]) {
        NSDictionary *parametersDic = @{
                                        @"token":[UsersManager sharedUsersManager].currentUser.token,
                                        @"aunt_id":[UsersManager sharedUsersManager].currentUser.aunt_id,
                                        @"old_pwd":self.oldPasswordTF.text,
                                        @"new_pwd":self.affirmPasswordTF.text
                                            
                                    };
        [MBProgressHUD showMessage:@"请求中"];
        [[TJNetworking manager] post:kPersonalURL parameters:parametersDic progress:nil success:^(TJNetworkingSuccessResponse * _Nonnull response) {
            if ([response.responseObject[@"code"] intValue] == 200) {
                [MBProgressHUD hideHUD];
                [MBProgressHUD showSuccess:@"修改成功"];
                [UsersManager sharedUsersManager].currentUser.pasword = self.affirmPasswordTF.text;
                [[UsersManager sharedUsersManager] save];
                [self.navigationController popViewControllerAnimated:YES];
            }else {
                [MBProgressHUD showSuccess:response.responseObject[@"message"]];
            }
            
        } failed:^(TJNetworkingFailureResponse * _Nonnull response) {
             [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"修改失败，请重试"];
        } finished:^{
            
        }];
    }else {
        
        [MBProgressHUD showSuccess:@"密码不一致，请检查密码"];
    }
    
   
}




@end

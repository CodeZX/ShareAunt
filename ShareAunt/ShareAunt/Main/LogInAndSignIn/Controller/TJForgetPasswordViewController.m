//
//  TJForgetPasswordViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/11.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJForgetPasswordViewController.h"
#import "TJInputVerificationCodeViewController.h"

@interface TJForgetPasswordViewController ()
@property (nonatomic,weak) UITextField *phoneNumberTF;
@end

@implementation TJForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}

- (void)setupUI {
    
    self.title = @"忘记密码";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.font = [UIFont systemFontOfSize:18];
    titleLab.text = @"验证手机号";
    [self.view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).offset(56);
    }];
    
    
   
    
    
    UITextField *phoneNumberTF = [[UITextField alloc]init];
//    phoneNumberTF.backgroundColor = [UIColor redColor];
    phoneNumberTF.font = [UIFont systemFontOfSize:15];
    phoneNumberTF.textAlignment = NSTextAlignmentCenter;
//    phoneNumberTF.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
//    phoneNumberTF.layer.borderWidth = 1;
    phoneNumberTF.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
    phoneNumberTF.adjustsFontSizeToFitWidth = YES;
    phoneNumberTF.keyboardType = UIKeyboardTypeDefault;
    phoneNumberTF.returnKeyType = UIReturnKeyNext;
//    phoneNumberTF.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my"]];
    phoneNumberTF.leftViewMode = UITextFieldViewModeAlways;
    phoneNumberTF.placeholder = @"请输入手机号码";
    phoneNumberTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:phoneNumberTF];
    self.phoneNumberTF = phoneNumberTF;
    [self.phoneNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(titleLab.bottom).offset(30);
        make.centerX.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view).offset(80);
        make.right.equalTo(weakSelf.view).offset(-80);
//        make.height.equalTo(56);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneNumberTF.bottom);
        make.left.right.equalTo(phoneNumberTF);
        make.height.equalTo(1);
    }];
    
    UILabel *areaCodeLab = [[UILabel alloc]init];
//    areaCodeLab.font = [UIFont systemFontOfSize:15];
    areaCodeLab.font = [UIFont boldSystemFontOfSize:15];
    areaCodeLab.text = @"+86";
    [self.view addSubview:areaCodeLab];
    [areaCodeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneNumberTF);
        make.right.equalTo(phoneNumberTF.left).offset(-10);
    }];
    
    
    UIButton *confirmBtn = [[UIButton alloc]init];
    confirmBtn.backgroundColor = MOTIF_BUTTON_COLOR;
    confirmBtn.layer.cornerRadius = 5;
    confirmBtn.layer.masksToBounds = YES;
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneNumberTF.bottom).offset(70);
        make.height.equalTo(33);
        make.right.equalTo(weakSelf.view).offset(-110);
        make.left.equalTo(weakSelf.view).offset(110);
    }];
    
    
}
- (void)confirmBtnClicked:(UIButton *)btn {
    
    TJInputVerificationCodeViewController *VC = [[TJInputVerificationCodeViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
@end

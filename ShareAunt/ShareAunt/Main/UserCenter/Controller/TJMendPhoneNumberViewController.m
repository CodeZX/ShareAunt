//
//  TJMendPhoneNumberViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/13.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJMendPhoneNumberViewController.h"
#import "TJVerificationCodeButton.h"

@interface TJMendPhoneNumberViewController ()
@property (nonatomic,weak) UIView *inputView;
@property (nonatomic,weak) UITextField *phoneNumberTF;
@property (nonatomic,weak) UITextField *verificationCodeTF;
@property (nonatomic,weak) UITextField *passwordTF;
@property (nonatomic,weak) UIButton *nextBtn;
@property (nonatomic,strong) UITextField *freshPhoneNumberTF;
@end

@implementation TJMendPhoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


- (void)setupUI {
    
    self.title = @"修改手机号码";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    
    [self setupInputView];
    
    
    
    UIButton *nextBtn = [UIButton TJ_buttonWithTitle:@"下一步" titleColor:[UIColor whiteColor] titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15] backgroundColor:MOTIF_BUTTON_COLOR];
    [nextBtn addTarget:self action:@selector(nextBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    nextBtn.layer.cornerRadius = 5;
    nextBtn.layer.masksToBounds = YES;
    [self.view addSubview:nextBtn];
    self.nextBtn = nextBtn;
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(SCREEN_HEIGHT *SCALE_Y(218));
        make.left.equalTo(weakSelf.view).offset(SCREEN_WIDTH *SCALE_X(30));
        make.right.equalTo(weakSelf.view).offset(-SCREEN_WIDTH *SCALE_X(30));
        make.height.equalTo(nextBtn.width).multipliedBy(SCALE_H(315, 55));
    }];
    
   
    
}

- (void)nextBtnClicked:(UIButton *)btn {
    
//    __weak typeof(self) weakSelf = self;
    
//    [self.inputView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(weakSelf.view.left).offset(-5);
//    }];
//
//    [self.freshPhoneNumberTF mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(weakSelf.view).offset(30);
//    }];
//
//    [UIView animateWithDuration:1 animations:^{
//        [self.inputView layoutIfNeeded];
//        [self.freshPhoneNumberTF layoutIfNeeded];
//    }];
    if (!_freshPhoneNumberTF) {
        [UIView animateWithDuration:1 animations:^{
            self.inputView.alpha = 0;
            CGRect rect1 = self.inputView.frame;
            CGRect rect2 = self.freshPhoneNumberTF.frame;
            rect2.origin.x = rect1.origin.x;
            self.freshPhoneNumberTF.frame = rect2;
            
            rect1.origin.x = -rect1.size.width;
            self.inputView.frame = rect1;
            
        }];
    } else {
        
        [MBProgressHUD show:@"成功" icon:@"successful.png" view:self.view];
    }
    
}




- (void)setupInputView {
    
    __weak typeof(self) weakSelf = self;
    
    
    CGFloat inputViewX,inputViewY,inputViewW,inputViewH;
    inputViewW = SCREEN_WIDTH * SCALE_X(315);
    inputViewH = inputViewW *SCALE_H(315, 112);
    inputViewX = (SCREEN_WIDTH - inputViewW) / 2;
    inputViewY = SCREEN_HEIGHT *SCALE_Y(50);
    UIView *inputView = [[UIView alloc]initWithFrame:CGRectMake(inputViewX, inputViewY, inputViewW, inputViewH)];
    //    inputView.backgroundColor = [UIColor redColor];
    inputView.layer.cornerRadius = 5;
    inputView.layer.masksToBounds = YES;
    inputView.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
    inputView.layer.borderWidth = 1;
    [self.view addSubview:inputView];
    self.inputView = inputView;
//    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.view).offset(SCREEN_HEIGHT * SCALE_Y(50));
//        make.left.equalTo(weakSelf.view).offset(30);
//        make.right.equalTo(weakSelf.view).offset(-30);
//        make.height.equalTo(weakSelf.inputView.width).multipliedBy(SCALE_H(315, 112));
//    }];
    
    
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
//    phoneNumberTF.leftView = [self setleftViewWithName:@"icon_user"];
//    phoneNumberTF.leftViewMode = UITextFieldViewModeAlways;
    phoneNumberTF.placeholder = @"123****4567";
    phoneNumberTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
    [self.inputView addSubview:phoneNumberTF];
    self.phoneNumberTF = phoneNumberTF;
    [self.phoneNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.inputView);
        make.centerX.equalTo(weakSelf.inputView);
        make.left.equalTo(weakSelf.inputView).offset(25);
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
//    verificationCodeTF.leftView = [self setleftViewWithName:@"icon_password"];
//    verificationCodeTF.leftViewMode = UITextFieldViewModeAlways;
    verificationCodeTF.placeholder = @"请输入验证码";
    verificationCodeTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
//    [verificationCodeTF setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:verificationCodeTF];
    self.verificationCodeTF = verificationCodeTF;
    [self.verificationCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.phoneNumberTF.bottom);
        make.centerX.equalTo(weakSelf.inputView);
        make.left.equalTo(weakSelf.inputView).offset(25);
        make.right.equalTo(weakSelf.inputView);
        make.height.equalTo(56);
    }];
    
    
//    UIView *lineView1 = [[UIView alloc]init];
//    lineView1.backgroundColor = [UIColor jk_colorWithHex:0xB1B1B0];
//    [self.inputView addSubview:lineView1];
//    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.verificationCodeTF.bottom);
//        make.left.right.equalTo(weakSelf.inputView);
//        make.height.equalTo(1);
//    }];
    
    
//    UITextField *passwordTF = [[UITextField alloc]init];
//    //    phoneNumberTF.textAlignment = NSTextAlignmentCenter;
//    //    passwordTF.layer.borderColor = [UIColor jk_colorWithHex:0xB1B1B0].CGColor;
//    //    passwordTF.layer.borderWidth = 1;
//    //    passwordTF.layer.cornerRadius = 5;
//    //    passwordTF.layer.masksToBounds = YES;
//    passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
//    passwordTF.adjustsFontSizeToFitWidth = YES;
//    passwordTF.keyboardType = UIKeyboardTypeDefault;
//    passwordTF.returnKeyType = UIReturnKeyNext;
//    passwordTF.leftView = [self setleftViewWithName:@"icon_password"];
//    passwordTF.leftViewMode = UITextFieldViewModeAlways;
//    passwordTF.placeholder = @"请输入密码";
//    passwordTF.textColor = [UIColor jk_colorWithHex:0xB1B1B0];
//    [self.inputView addSubview:passwordTF];
//    self.passwordTF = passwordTF;
//    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.verificationCodeTF.bottom);
//        make.centerX.equalTo(weakSelf.inputView);
//        make.left.equalTo(weakSelf.inputView);
//        make.right.equalTo(weakSelf.inputView);
//        make.height.equalTo(56);
//    }];
    

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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------------------- lazy load ----------------------------------------
- (UITextField *)freshPhoneNumberTF {
    if (!_freshPhoneNumberTF) {
        __weak typeof(self) weakSelf = self;
        CGFloat TFX,TFY,TFW,TFH;
        TFW = SCREEN_WIDTH * SCALE_X(315);
        TFH = TFW *SCALE_H(315, 55);
        TFX = SCREEN_WIDTH;
        TFY = SCREEN_HEIGHT *SCALE_Y(50);
        _freshPhoneNumberTF = [[UITextField alloc]initWithFrame:CGRectMake(TFX, TFY, TFW, TFH)];
        _freshPhoneNumberTF.layer.borderColor = [UIColor jk_colorWithHex:0xE1E1E1].CGColor;
        _freshPhoneNumberTF.layer.borderWidth = 1;
        _freshPhoneNumberTF.layer.cornerRadius = 5;
        _freshPhoneNumberTF.layer.masksToBounds = YES;
        _freshPhoneNumberTF.placeholder = @"请输入新的手机号";
        _freshPhoneNumberTF.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_freshPhoneNumberTF];
//        [_freshPhoneNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(weakSelf.view).offset(SCREEN_HEIGHT * SCALE_Y(50));
//            make.left.equalTo(weakSelf.view.right).offset(5);
//            make.width.equalTo(300);
//            make.height.equalTo(weakSelf.inputView.width).multipliedBy(SCALE_H(315, 55));
//        }];
    
        
    }
    return _freshPhoneNumberTF;
}

@end

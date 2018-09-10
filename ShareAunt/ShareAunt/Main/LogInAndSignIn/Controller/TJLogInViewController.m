//
//  TJLogInViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/10.
//  Copyright © 2018年 TJ. All rights reserved.
//   登录

#import "TJLogInViewController.h"

@interface TJLogInViewController ()

@property (nonatomic,weak) UIImageView *logoImageV;
@property (nonatomic,weak) UITextField *phoneNumberTF;
@property (nonatomic,weak) UITextField *passwordTF;
@property (nonatomic,weak) UIButton *logInBtn;

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
        make.top.equalTo(weakSelf.view).offset(iPhoneX?84:64);
        make.size.equalTo(CGSizeMake(102, 122));
    }];
    
   
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//
//  TJVerificationCodeButton.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/11.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJVerificationCodeButton.h"


@interface TJVerificationCodeButton ()
/*
 * 定时器
 */
@property(strong,nonatomic) NSTimer *timer;

/*
 * 定时多少秒
 */
@property(assign,nonatomic) NSInteger count;
@end

@implementation TJVerificationCodeButton

#pragma mark - 初始化控件
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 配置
        [self setup];
        
    }
    
    return self;
}

#pragma mark - 配置


- (void)setup
{
    __weak typeof(self) weakSelf = self;
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor jk_colorWithHex:0xE1E1E1];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf);
        make.top.equalTo(weakSelf.top).offset(15);
        make.bottom.equalTo(weakSelf.bottom).offset(-15);
        make.width.equalTo(1);
    }];
    [self setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:10.f];
//    self.backgroundColor = [UIColor yellowColor];
    [self setTitleColor:MOTIF_BUTTON_COLOR forState:UIControlStateNormal];
    
//    [self.layer setBorderColor:[UIColor redColor].CGColor];
//    [self.layer setBorderWidth:2];
    
    self.layer.cornerRadius = 3.0f;
    self.layer.masksToBounds = YES;
    
}
#pragma mark - 添加定时器
- (void)timeFailBeginFrom:(NSInteger)timeCount
{
    self.count = timeCount;
    self.enabled = NO;
    // 加1个定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeDown) userInfo: nil repeats:YES];
    
    
}

#pragma mark - 定时器事件
- (void)timeDown
{
    if (self.count != 1){
        
        self.count -=1;
        self.enabled = NO;
        [self setTitle:[NSString stringWithFormat:@"剩余%ld秒", self.count] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    } else {
        
        self.enabled = YES;
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self setTitleColor:MOTIF_BUTTON_COLOR forState:UIControlStateNormal];
        [self.timer invalidate];
    }
    
}

@end

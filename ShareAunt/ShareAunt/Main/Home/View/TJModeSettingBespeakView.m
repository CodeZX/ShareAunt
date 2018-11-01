//
//  TJModeSettingBespeakView.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/21.
//  Copyright © 2018年 TJ. All rights reserved.
// 预约

#import "TJModeSettingBespeakView.h"
#import "TJDatePickerTextField.h"
#import "TJModeSettingAllView.h"



@interface TJModeSettingBespeakView ()

@property (nonatomic,weak) UILabel *titleLab;
@property (nonatomic,weak) TJDatePickerTextField *startTimeTF;
@property (nonatomic,weak) TJDatePickerTextField *endTimeTF;
@property (nonatomic,weak) UIDatePicker *datePicker;
@property (nonatomic,weak) UIToolbar *toolbar;

@property (nonatomic,strong) NSString *startTimeStr;
@property (nonatomic,strong) NSString *endTimeStr;


@property (nonatomic,strong) NSString *startTimeDate;
@property (nonatomic,strong) NSString *endTimeDate;


@end
@implementation TJModeSettingBespeakView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
//    self.backgroundColor = [UIColor yellowColor];
    __weak typeof(self) weakSelf = self;
    UILabel *titleLab = [UILabel labelWithText:@"设置预约时间" textColor:[UIColor jk_colorWithHex:0x909090] fontName:@"PingFangSC-Regular" fontSize:15 wordSpace:4];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLab];
    self.titleLab = titleLab;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.top).offset(28);
        make.centerX.equalTo(weakSelf);
    }];
    
    TJDatePickerTextField *startTimeTF = [[TJDatePickerTextField alloc]init];
    startTimeTF.adjustsFontSizeToFitWidth = YES;
    startTimeTF.minimumFontSize = 10;
    startTimeTF.textAlignment = NSTextAlignmentCenter;
    startTimeTF.backgroundColor = [UIColor jk_colorWithHex:0x25252F];
    startTimeTF.textColor = [UIColor jk_colorWithHex:0x909090];
    startTimeTF.text = @"从现在";
    startTimeTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    [self addSubview:startTimeTF];
    self.startTimeTF = startTimeTF;
    [self.startTimeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.bottom).offset(96);
        make.right.equalTo(weakSelf.centerX).offset(-32);
        make.left.equalTo(weakSelf.right).multipliedBy(SCALE_k(50, 375));
        make.height.equalTo(weakSelf.startTimeTF.width).multipliedBy(SCALE_H(100, 35));
        
    }];
    
    UILabel *lab = [UILabel labelWithText:@"至" textColor:[UIColor whiteColor] fontName:@"PingFangSC-Regular" fontSize:15 wordSpace:5];
    [self addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(weakSelf.startTimeTF);
        make.centerX.equalTo(weakSelf);
    }];
    
    
    TJDatePickerTextField *endTimeTF = [[TJDatePickerTextField alloc]init];
    endTimeTF.adjustsFontSizeToFitWidth = YES;
    endTimeTF.minimumFontSize = 10;
    endTimeTF.textAlignment = NSTextAlignmentCenter;
    endTimeTF.backgroundColor = [UIColor jk_colorWithHex:0x25252F];
    endTimeTF.textColor = [UIColor jk_colorWithHex:0x909090];
    endTimeTF.text = @"任意时间";
    endTimeTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    [self addSubview:endTimeTF];
    self.endTimeTF = endTimeTF;
    [self.endTimeTF mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(titleLab.bottom).offset(96);
        make.left.equalTo(weakSelf.centerX).offset(32);
        make.right.equalTo(weakSelf.right).multipliedBy(1 - SCALE_k(50, 375));
        make.height.equalTo(weakSelf.startTimeTF.width).multipliedBy(SCALE_H(100, 35));
        
    }];
    

     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resignResponder) name:@"resignFirstResponder" object:nil];
    
}

- (void)resignResponder {
    
    [self.startTimeTF resignFirstResponder];
    [self.endTimeTF resignFirstResponder];
}

- (NSDictionary *)getBespeakTitme {
   
    if (self.startTimeTF.date > 0 && self.endTimeTF.date) {
        return @{ jobModeKeyStart:self.startTimeTF.date,
                 jobModeKeyEnd:self.endTimeTF.date
                 };
    }else {
        return nil;
    }
    
}
@end

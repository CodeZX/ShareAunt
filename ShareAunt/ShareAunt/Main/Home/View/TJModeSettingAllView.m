//
//  TJModeSettingAllView.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/21.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJModeSettingAllView.h"
#import "TJDatePickerTextField.h"


@interface TJModeSettingAllView  ()

@property (nonatomic,weak) UIButton *areaSelectBtn;
@property (nonatomic,weak) UIButton *addressSelectBtn;

@property (nonatomic,weak) UILabel *titleLab;
@property (nonatomic,weak) TJDatePickerTextField *startTimeTF;
@property (nonatomic,weak) TJDatePickerTextField *endTimeTF;


@property (nonatomic,strong) NSString *areaStr;
@property (nonatomic,strong) NSString *destinationStr;
@property (nonatomic,strong) NSString *startTimeStr;
@property (nonatomic,strong) NSString *endTimeStr;

@end
@implementation TJModeSettingAllView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
//    self.backgroundColor = [UIColor orangeColor];
    __weak typeof(self) weakSelf = self;
    UIButton *areaSelectBtn = [UIButton TJ_buttonWithTitle:@"选择区域" titleColor:[UIColor jk_colorWithHex:0x909090] titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15] imageName:@"Rightarrow" selectImageName:nil backgroundColor:[UIColor jk_colorWithHex:0x25252F]];
    [self addSubview:areaSelectBtn];
    self.areaSelectBtn = areaSelectBtn;
    [self.areaSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.top).offset(40);
        make.centerX.equalTo(weakSelf);
        make.left.equalTo(weakSelf.right).multipliedBy(SCALE_k(30, 375));
        make.right.equalTo(weakSelf.right).multipliedBy(1 -  SCALE_k(30, 375));
        make.height.equalTo(areaSelectBtn.width).multipliedBy(SCALE_H(315, 40));
        //        make.height.equalTo(30);
    }];
    [self.areaSelectBtn jk_setImagePosition:LXMImagePositionRight spacing:200];
    
    UIButton *addressSelectBtn = [UIButton TJ_buttonWithTitle:@"目的地点" titleColor:[UIColor jk_colorWithHex:0x909090] titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15] imageName:@"Rightarrow" selectImageName:nil backgroundColor:[UIColor jk_colorWithHex:0x25252F]];
    [self addSubview:addressSelectBtn];
    self.addressSelectBtn = addressSelectBtn;
    [self.addressSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.center.equalTo(weakSelf).offset(CGPointMake(0, 30));
        make.centerX.equalTo(weakSelf).offset(CGPointMake(0, 20));
        make.top.equalTo(weakSelf.areaSelectBtn.bottom).offset(20);
        make.left.equalTo(weakSelf.right).multipliedBy(SCALE_k(30, 375));
        make.right.equalTo(weakSelf.right).multipliedBy(1 -  SCALE_k(30, 375));
        make.height.equalTo(addressSelectBtn.width).multipliedBy(SCALE_H(315, 40));
        //        make.height.equalTo(30);
    }];
    [self.addressSelectBtn jk_setImagePosition:LXMImagePositionRight spacing:200];
    
    UILabel *titleLab = [UILabel labelWithText:@"设置预约时间" textColor:[UIColor jk_colorWithHex:0x909090] fontName:@"PingFangSC-Regular" fontSize:15 wordSpace:4];
    
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLab];
    self.titleLab = titleLab;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.addressSelectBtn.bottom).offset(28);
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
        make.top.equalTo(titleLab.bottom).offset(33);
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
        make.top.equalTo(titleLab.bottom).offset(33);
        make.left.equalTo(weakSelf.centerX).offset(32);
        make.right.equalTo(weakSelf.right).multipliedBy(1 - SCALE_k(50, 375));
        make.height.equalTo(weakSelf.startTimeTF.width).multipliedBy(SCALE_H(100, 35));
        
    }];
    
}


- (NSDictionary *)getJobMode {
    
    if (self.areaStr.length > 0 && self.destinationStr.length > 0  && self.startTimeTF.date && self.endTimeTF.date ) {
        return @{
                 jobModeKeyArea:self.areaStr,
                 jobModeKeyDestination:self.destinationStr,
                 jobModeKeyStart:self.startTimeStr,
                 jobModeKeyEnd:self.endTimeStr
                 };
    }else {
        return nil;
    }
    
}
@end

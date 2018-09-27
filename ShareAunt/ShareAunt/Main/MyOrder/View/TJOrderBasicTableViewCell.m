//
//  TJOrderBasicTableViewCell.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/26.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJOrderBasicTableViewCell.h"

@interface TJOrderBasicTableViewCell ()


@property (nonatomic,weak) UILabel *orderType;
@property (nonatomic,weak) UILabel *orderStatusLab;
@property (nonatomic,weak) UIImageView *indicateImagV;
@property (nonatomic,weak) UIView *containerView;
// 订单号
@property (nonatomic,weak) UILabel *orderNumberLab;
@property (nonatomic,weak) UILabel *orderNumberValueLab;

// 地址
@property (nonatomic,weak) UILabel *addressLab;
@property (nonatomic,weak) UILabel *addressValueLab;

// 内容
@property (nonatomic,weak) UILabel *jobDescriptionLab;
@property (nonatomic,weak) UILabel *jobDescriptionValueLab;

// 时长
@property (nonatomic,weak) UILabel *durationLab;
@property (nonatomic,weak) UILabel *durationValueLab;

@end
@implementation TJOrderBasicTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    
    return self;
}
- (void)setupUI {
    
    
    __weak typeof(self) weakSelf = self;
    self.contentView.backgroundColor = [UIColor jk_colorWithHex:0xEFEFEF];
    
    UILabel *orderType = [UILabel labelWithText:@"类型" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFangSC-Regular" fontSize:14 wordSpace:0];
    [self.contentView addSubview:orderType];
    self.orderType = orderType;
    [self.orderType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView).offset(11);
        make.left.equalTo(weakSelf).offset(31);
    }];
    
    
    UIView *containerView = [[UIView alloc]init];
//    containerView.layer.borderColor = [UIColor jk_colorWithHex:0x201B17].CGColor;
//    containerView.layer.borderWidth = 1;
    containerView.backgroundColor = [UIColor whiteColor];
    containerView.layer.shadowColor = [UIColor jk_colorWithHex:0x272727].CGColor;
    containerView.layer.shadowOffset = CGSizeMake(1, 1);
    containerView.layer.shadowOpacity = 0.6;
    [self.contentView addSubview:containerView];
    self.containerView = containerView;
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.contentView).offset(UIEdgeInsetsMake(33, 15, 0, 15));
    }];
    
   
    UILabel *orderNumberLab = [UILabel labelWithText:@"订单号:" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:orderNumberLab];
    self.orderNumberLab = orderNumberLab;
    [self.orderNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(10);
        make.left.equalTo(15);
    }];
    UILabel *orderNumberValueLab = [UILabel labelWithText:@"00001" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:orderNumberValueLab];
    self.orderNumberValueLab = orderNumberValueLab;
    [self.orderNumberValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.orderNumberLab);
        make.left.equalTo(weakSelf.orderNumberLab.right).offset(34);
    }];
    
    
    UILabel *addressLab = [UILabel labelWithText:@"工作地点:" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:addressLab];
    self.addressLab = addressLab;
    [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.orderNumberLab.bottom).offset(10);
        make.left.equalTo(weakSelf.orderNumberLab);
    }];
    UILabel *addressValueLab = [UILabel labelWithText:@"临空经济园区" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:addressValueLab];
    self.addressValueLab = addressValueLab;
    [self.addressValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.addressLab);
        make.left.equalTo(weakSelf.orderNumberValueLab);
    }];
    
    
    UILabel *jobDescriptionLab = [UILabel labelWithText:@"工作内容:" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:jobDescriptionLab];
    self.jobDescriptionLab = jobDescriptionLab;
    [self.jobDescriptionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.addressValueLab.bottom).offset(10);
        make.left.equalTo(weakSelf.orderNumberLab);
    }];
    UILabel *jobDescriptionValueLab = [UILabel labelWithText:@"日常保洁" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:jobDescriptionValueLab];
    self.jobDescriptionValueLab = jobDescriptionValueLab;
    [self.jobDescriptionValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.jobDescriptionLab);
        make.left.equalTo(weakSelf.addressValueLab);
    }];
    
    UILabel *durationLab = [UILabel labelWithText:@"工作时长:" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:durationLab];
    self.durationLab = durationLab;
    [self.durationLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.jobDescriptionLab.bottom).offset(10);
        make.left.equalTo(weakSelf.orderNumberLab);
    }];
    UILabel *durationValueLab = [UILabel labelWithText:@"2小时" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:0];
    [self.containerView addSubview:durationValueLab];
    self.durationValueLab = durationValueLab;
    [self.durationValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.durationLab);
        make.left.equalTo(weakSelf.jobDescriptionValueLab);
    }];
    
    
    UILabel *orderStatusLab = [UILabel labelWithText:@"状态" textColor:MOTIF_BUTTON_COLOR fontName:@"PingFangSC-Regular" fontSize:16 wordSpace:0];
    [self.containerView addSubview:orderStatusLab];
    self.orderStatusLab = orderStatusLab;
    [self.orderStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.containerView).offset(10);
        make.right.equalTo(weakSelf.containerView).offset(-40);
    }];
    
    UIImageView *indicateImagV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"right"]];
    [self.containerView addSubview:indicateImagV];
    self.indicateImagV = indicateImagV;
    [self.indicateImagV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.orderStatusLab);
        make.right.equalTo(weakSelf.containerView).offset(-10);
        make.size.equalTo(CGSizeMake(8, 10));
    }];
}

- (void)setOrderModel:(TJOrderModel *)orderModel {
    _orderModel = orderModel;
    
    
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

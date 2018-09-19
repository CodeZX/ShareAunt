//
//  TJCertificationMaterialsFooterViewCell.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/18.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJCertificationMaterialsFooterViewCell.h"
#import "TJCertificationMaterialsFooterViewItemModel.h"


@interface TJCertificationMaterialsFooterViewCell ()

@property (nonatomic,weak) UIImageView *identityImageV;
@property (nonatomic,weak) UILabel *titleLab;

@end
@implementation TJCertificationMaterialsFooterViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    
    
    __weak typeof(self) weakSelf = self;
//    self.contentView.layer.borderColor = [UIColor jk_colorWithHex:0x494E5C].CGColor;
//    self.contentView.layer.borderWidth = 1;
//    self.contentView.backgroundColor = [UIColor redColor];
    
    UIView *rectView = [[UIView alloc]init];
    rectView.layer.borderColor = [UIColor jk_colorWithHex:0x494E5C].CGColor;
    rectView.layer.borderWidth = 1;
    [self.contentView addSubview:rectView];
    [rectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(0, 10, 20, 10));
    }];
    
    UIImageView *identityImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"add"]];
//    identityImageV.layer.borderColor = [UIColor jk_colorWithHex:0x494E5C].CGColor;
//    identityImageV.layer.borderWidth = 1;
    [rectView addSubview:identityImageV];
    self.identityImageV = identityImageV;
    [self.identityImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(rectView);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
    
    UILabel *titleLab = [UILabel labelWithText:@"" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:15 wordSpace:3];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLab];
    self.titleLab = titleLab;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.contentView.bottom);
        make.left.right.equalTo(weakSelf.contentView);
        
    }];
}

- (void)setItemModel:(TJCertificationMaterialsFooterViewItemModel *)itemModel {
    
    _itemModel = itemModel;
    
    self.titleLab.text  = itemModel.title;
}
@end

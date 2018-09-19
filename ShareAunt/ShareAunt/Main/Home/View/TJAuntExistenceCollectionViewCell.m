//
//  TJAuntExistenceCollectionViewCell.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/19.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJAuntExistenceCollectionViewCell.h"
#import "TJAuntExistenceItemModel.h"

@interface TJAuntExistenceCollectionViewCell ()

@property (nonatomic,weak) UIImageView *imagV;
@property (nonatomic,weak) UILabel *titleLab;
@end
@implementation TJAuntExistenceCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    
    __weak typeof(self) weakSelf = self;
    UIImageView *imagV = [[UIImageView alloc]init];
    [self.contentView addSubview:imagV];
    self.imagV = imagV;
    [self.imagV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView);
        make.centerX.equalTo(weakSelf.contentView);
        make.size.equalTo(CGSizeMake(44, 44));
        
    }];
    
    UILabel *titleLab = [UILabel labelWithText:@"" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFang-SC-Regular" fontSize:12 wordSpace:0];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLab];
    self.titleLab = titleLab;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.contentView);
    }];
    
}

- (void)setItemModel:(TJAuntExistenceItemModel *)itemModel {
    
    _itemModel = itemModel;
    self.imagV.image = [UIImage imageNamed:itemModel.pictureName];
    self.titleLab.text = itemModel.title;
    
    
    
}
@end

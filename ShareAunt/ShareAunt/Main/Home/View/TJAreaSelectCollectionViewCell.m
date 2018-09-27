//
//  TJAreaSelectCollectionViewCell.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/25.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJAreaSelectCollectionViewCell.h"
#import "TJAreaSelectItemModel.h"
@interface TJAreaSelectCollectionViewCell ()

@property (nonatomic,weak) UILabel *titleLab;
@end
@implementation TJAreaSelectCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI  {
    __weak typeof(self) weakSelf = self;
    self.contentView.layer.cornerRadius = 5;
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.borderColor = MOTIF_BUTTON_COLOR.CGColor;
    self.contentView.layer.borderWidth = 1;
    
//    self.contentView.backgroundColor = [UIColor redColor];
    UILabel *titleLab = [UILabel labelWithText:@"11111" textColor:MOTIF_BUTTON_COLOR fontName:@"PingFang-SC-Regular" fontSize:14 wordSpace:5];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLab];
    self.titleLab = titleLab;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf);
//        make.left.top.equalTo(weakSelf);
    }];
    
}

- (void)setItemModel:(TJAreaSelectItemModel *)itemModel {
    
    _itemModel = itemModel;
    self.titleLab.text = itemModel.title;
}
@end

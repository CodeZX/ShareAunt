//
//  TJPersonalInformationTableViewCell.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/13.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJPersonalInformationTableViewCell.h"
#import "TJPersonalInformationItemModel.h"


@interface TJPersonalInformationTableViewCell ()

@property (nonatomic,weak) UILabel *rightLab;
@end
@implementation TJPersonalInformationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    __weak typeof(self) weakSelf = self;
    UILabel *rightLab = [UILabel labelWithText:@"11" textColor:[UIColor jk_colorWithHex:0xE1E1E1] fontName:@"PingFangSC-Regular" fontSize:15 wordSpace:0];
    rightLab.hidden = YES;
    [self.contentView addSubview:rightLab];
    self.rightLab = rightLab;
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.contentView);
        make.right.equalTo(weakSelf.contentView).offset(-20);
    }];
    
    self.textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    self.textLabel.textColor = [UIColor jk_colorWithHex:0x272727];
}

- (void)setItemModel:(TJPersonalInformationItemModel *)itemModel {
    _itemModel = itemModel;
    self.textLabel.text = itemModel.title;
    if (itemModel.rightTitle) {
        self.rightLab.hidden = NO;
        self.rightLab.text = itemModel.rightTitle;
    }
   
    
    
    
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

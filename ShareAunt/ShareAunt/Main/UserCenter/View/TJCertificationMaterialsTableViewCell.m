//
//  TJCertificationMaterialsTableViewCell.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/18.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJCertificationMaterialsTableViewCell.h"
#import "TJCertificationMaterialsItemModel.h"
@implementation TJCertificationMaterialsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.textLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
    self.textLabel.textColor = [UIColor jk_colorWithHex:0x272727];
    
}


- (void)setItemModel:(TJCertificationMaterialsItemModel *)itemModel {
    _itemModel = itemModel;
    
    
    self.textLabel.text = itemModel.title;
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

//
//  TJSettingTableViewCell.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/13.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJSettingTableViewCell.h"
#import "TJSettingItemModel.h"
@interface TJSettingTableViewCell ()

@property (nonatomic,weak) UISwitch *switchBtn;
@end
@implementation TJSettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    __weak typeof(self) weakSelf = self;
    UISwitch *switchBtn = [[UISwitch alloc]init];
    switchBtn.hidden = YES;
    switchBtn.onTintColor = MOTIF_BUTTON_COLOR;
//    switchBtn.thumbTintColor = [UIColor whiteColor];
    [self.contentView addSubview:switchBtn];
    self.switchBtn = switchBtn;
    [self.switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.contentView);
        make.right.equalTo(weakSelf.contentView).offset(-15);
    }];
    
    
    self.textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    self.textLabel.textColor = [UIColor jk_colorWithHex:0x272727];
    
}

-(void)setItemModel:(TJSettingItemModel *)itemModel {
    _itemModel = itemModel;
    self.textLabel.text = itemModel.title;
    if (itemModel.accessoryType == TJSettingItemAccessoryTypeIndicator | itemModel.accessoryType == TJSettingItemAccessoryTypeDefault) {
        self.switchBtn.hidden  = YES;
        self.accessoryType = UITableViewCellAccessoryDetailButton;
        
    }else if (itemModel.accessoryType == TJSettingItemAccessoryTypeSwitch)
        self.switchBtn.hidden = NO;
       self.accessoryType = UITableViewCellAccessoryNone;
    
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

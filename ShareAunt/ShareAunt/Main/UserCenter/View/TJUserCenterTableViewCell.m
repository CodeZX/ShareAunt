//
//  TJUserCenterTableViewCell.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJUserCenterTableViewCell.h"
#import "TJUserCenterItemModel.h"
@interface TJUserCenterTableViewCell ()

@property (nonatomic,weak) UIView *containerView;
@property (nonatomic,weak) UIImageView *pictureImgv;
@property (nonatomic,weak) UILabel *titleLab;


@end

@implementation TJUserCenterTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    __weak typeof(self) weakSelf = self;
    self.contentView.backgroundColor = [UIColor jk_colorWithHex:0xEFEFEF];
    
    UIView *containerView = [[UIView alloc]init];
    containerView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:containerView];
    self.containerView = containerView;
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.contentView);
        make.bottom.equalTo(weakSelf.contentView).offset(-5);
//        make.height.equalTo(weakSelf.contentView.height);
    }];
    
    
    UIImageView *pictureImgv = [[UIImageView alloc]init];
//    pictureImgv.backgroundColor = [UIColor redColor];
    [self.containerView addSubview:pictureImgv];
    self.pictureImgv = pictureImgv;
    [self.pictureImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.containerView);
        make.left.equalTo(15);
        make.size.equalTo(CGSizeMake(15, 15));
    }];

    UILabel *titleLab = [[UILabel alloc]init];
//    titleLab.backgroundColor = [UIColor lightGrayColor];
    [self.containerView addSubview:titleLab];
    self.titleLab = titleLab;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf.pictureImgv.right).offset(10);
        make.height.equalTo(20);
        make.width.equalTo(100);
    }];

    UIImageView *indicateImgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Rightarrow"]];
//    indicateImgv.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:indicateImgv];
    [indicateImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.containerView);
        make.right.equalTo(-15);
        make.size.equalTo(CGSizeMake(8, 15));
    }];
}


- (void)setItemModel:(TJUserCenterItemModel *)itemModel {
    
    _itemModel = itemModel;
    self.titleLab.text = itemModel.title;
    self.pictureImgv.image = [UIImage imageNamed:itemModel.imageName];
    
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

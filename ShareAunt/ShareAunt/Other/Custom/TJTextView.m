//
//  TJTextView.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/10/11.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJTextView.h"

@interface TJTextView ()
@property (nonatomic,weak) UILabel *placeholderLab;
@property (nonatomic,strong) NSString *placeholder;
@end
@implementation TJTextView

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setupUI];
//
//    }
//    return self;
//}

- (instancetype)initWithPlaceholder:(NSString *)placeholder {
    self = [super init];
    if (self) {
        self.placeholder = placeholder;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    __weak typeof(self) weakSelf = self;
    self.font = [UIFont systemFontOfSize:16];
    UILabel *placeholderLab = [UILabel labelWithText:self.placeholder textColor:[UIColor jk_colorWithHex:0x9A9A9A] fontName:@"PingFang-SC-Medium" fontSize:16 wordSpace:0];
    [self addSubview:placeholderLab];
    self.placeholderLab = placeholderLab;
    [self.placeholderLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.top).offset(10);
        make.left.equalTo(weakSelf).offset(10);
    }];
    
    
}

- (void)hidePlaceholder {
    
    self.placeholderLab.hidden  = YES;
}

- (void)showPlaceholder {
    self.placeholderLab.hidden = NO;
}
@end

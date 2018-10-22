//
//  TJPasswordTextFeld.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/11.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJPasswordTextFeld.h"

@interface TJPasswordTextFeld ()<UITextFieldDelegate>

@property (nonatomic,strong) NSMutableArray *underlineArray;
@property (nonatomic,strong) NSMutableArray *placeholderArray;
@end


#define kDotSize CGSizeMake (10, 10) //密码点的大小
#define KplaceholderCount 6  //密码个数
#define KunderlineInterval 10  //密码个数


@implementation TJPasswordTextFeld
{
    NSInteger _location;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //输入的文字颜色为白色
        self.textColor = [UIColor clearColor];
        //输入框光标的颜色为白色
        self.tintColor = [UIColor clearColor];
        self.delegate = self;
//        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.keyboardType = UIKeyboardTypeNumberPad;
        self.returnKeyType = UIReturnKeyNext;
//        self.layer.borderColor = [[UIColor grayColor] CGColor];
//        self.layer.borderWidth = 1;
//        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
//        [self setupUI];
    }
    return self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    TJLog(@"变化%@ %ld %ld", string,range.location,range.length);
    if([string isEqualToString:@"\n"]) {
        //按回车关闭键盘
        [textField resignFirstResponder];
        return NO;
    } else if([string isEqualToString:@""]) {
        //判断是不是删除键
        UILabel *placeholderLab = self.placeholderArray[range.location];
        placeholderLab.text = @"";
        return YES;
    }
    else if(textField.text.length >= KplaceholderCount) {
        //输入的字符个数大于6，则无法继续输入，返回NO表示禁止输入
        NSLog(@"输入的字符个数大于6，忽略输入");
        return NO;
    } else {
        UILabel *placeholderLab = self.placeholderArray[range.location];
        placeholderLab.text = string;
        _location = range.location;
        return YES;
    }
    return YES;
}

- (void)deleteBackward {
    [super deleteBackward];
//    NSLog(@"%@",@"delete");
     UILabel *placeholderLab = self.placeholderArray[_location];
    placeholderLab.text = @"";
    if (_location !=0 ) {
       _location--;
    }
    
}

- (void)textFieldDidChange:(UITextField *)textField {
    
//    for (NSInteger index = 0; index < textField.text.length; index++) {
//        UILabel *placeholderLab = self.placeholderArray[index];
//        placeholderLab.hidden = NO;
//    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.underlineArray.count == 0) {
        [self setupUI];
    }
}

- (void)setupUI {
    
    __weak typeof(self) weakSelf = self;
    CGFloat underlineW = (self.frame.size.width - KunderlineInterval *(KplaceholderCount + 1)) / KplaceholderCount;
    for (NSInteger index = 0; index < KplaceholderCount; index++) {
        UIView *underlineWView = [[UIView alloc]init];
        underlineWView.backgroundColor = [UIColor jk_colorWithHex:0x272727];
        [self addSubview:underlineWView];
        [underlineWView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(weakSelf);
            make.left.equalTo(weakSelf).offset((underlineW +KunderlineInterval) * index + KunderlineInterval);
            make.height.equalTo(1);
            make.width.equalTo(underlineW);
        }];
        [self.underlineArray addObject:underlineWView];
        
        
        UILabel *placeholderLab = [[UILabel alloc]init];
        placeholderLab.textAlignment = NSTextAlignmentCenter;
//        placeholderLab.text = @"》";
        placeholderLab.font = [UIFont systemFontOfSize:25];
//        placeholderLab.hidden = YES;
        [self addSubview:placeholderLab];
        [placeholderLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(underlineWView);
            make.centerY.equalTo(weakSelf);
            
        }];
        [self.placeholderArray addObject:placeholderLab];
        
    }
    
}

#pragma mark -------------------------- lazy load ----------------------------------------
- (NSMutableArray *)underlineArray {
    if (!_underlineArray) {
        _underlineArray  = [[NSMutableArray alloc]init];
        
    }
    return _underlineArray;
}

- (NSMutableArray *)placeholderArray {
    if (!_placeholderArray) {
        _placeholderArray = [[NSMutableArray alloc]init];
        
    }
    return _placeholderArray;
}


@end

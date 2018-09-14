//
//  UILabel+Initialize.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "UILabel+Initialize.h"

@implementation UILabel (Initialize)
+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *)textColor fontName:(NSString *)fontName fontSize:(CGFloat)fontSize wordSpace:(CGFloat)wordSpace {
    
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = textColor;
    label.font = [UIFont fontWithName:fontName size:fontSize];
    [UILabel changeWordSpaceForLabel:label WithSpace:wordSpace];
    return label;
}
@end

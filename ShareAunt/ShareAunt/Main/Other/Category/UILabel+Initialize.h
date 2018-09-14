//
//  UILabel+Initialize.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Initialize)
+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *)textColor fontName:(NSString *)fontName fontSize:(CGFloat)fontSize wordSpace:(CGFloat)WordSpace;
@end

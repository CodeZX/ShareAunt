//
//  UIButton+TJinitialize.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TJinitialize)
+ (UIButton *)buttonWithTitle:(NSString *)title imageName:(NSString *)imageName;

+ (UIButton *)TJ_buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont imageName:(NSString *)imageName  selectImageName:(NSString *)selectImageName backgroundColor:(UIColor *)backgroundColor;

+ (UIButton *)TJ_buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont  backgroundColor:(UIColor *)backgroundColor;
@end

//
//  UIButton+TJinitialize.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "UIButton+TJinitialize.h"

@implementation UIButton (TJinitialize)
+ (UIButton *)buttonWithTitle:(NSString *)title imageName:(NSString *)imageName {
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return button;

}


+(UIButton *)TJ_buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName backgroundColor:(UIColor *)backgroundColor {
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = titleFont;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    button.backgroundColor = backgroundColor;
    
    return button;
}

+ (UIButton *)TJ_buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont backgroundColor:(UIColor *)backgroundColor {
    
    return [self TJ_buttonWithTitle:title titleColor:titleColor titleFont:titleFont imageName:nil selectImageName:nil backgroundColor:backgroundColor];
}
@end

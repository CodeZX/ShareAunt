//
//  TJSettingItemModel.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/13.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJSettingItemModel.h"

@implementation TJSettingItemModel

- (instancetype)initWithTitle:(NSString *)title accessoryType:(TJSettingItemAccessoryType)accessoryType block:(actionbBlock)block{
    self = [super init];
    if (self) {
        self.title = title;
        self.accessoryType = accessoryType;
        self.block = block;
    }
    return self;
}
@end

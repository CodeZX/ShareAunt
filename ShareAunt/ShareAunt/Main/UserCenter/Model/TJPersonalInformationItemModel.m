//
//  TJPersonalInformationItemModel.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/13.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJPersonalInformationItemModel.h"

@implementation TJPersonalInformationItemModel

- (instancetype)initWithTitle:(NSString *)title rightTitle:(NSString *)rightTitle accessoryType:(TJPersonalInformationAccessoryType)accessoryType block:(actionbBlock)block {
    
    self = [super init];
    if (self) {
        self.title = title;
        self.rightTitle = rightTitle;
        self.accessoryType = accessoryType;
        self.block = block;
        
    }
    return self;
}
@end

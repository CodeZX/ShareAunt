//
//  TJUserCenterItemModel.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJUserCenterItemModel.h"

@implementation TJUserCenterItemModel

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName block:(actionbBlock)block {
    self = [super init];
    if (self) {
        self.title = title;
        self.imageName = imageName;
        self.block = block;
    }
    return self;
}
@end

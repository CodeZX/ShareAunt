//
//  TJCertificationMaterialsItemModel.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/18.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJCertificationMaterialsItemModel.h"

@implementation TJCertificationMaterialsItemModel
- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

@end

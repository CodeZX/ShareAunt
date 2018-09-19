//
//  TJAuntExistenceItemModel.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/19.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJAuntExistenceItemModel.h"

@implementation TJAuntExistenceItemModel
- (instancetype)initWithTitle:(NSString *)title pictureName:(NSString *)pictureName {
    self = [super init];
    if (self) {
        self.title = title;
        self.pictureName = pictureName;
    }
    return self;
}

@end

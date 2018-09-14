//
//  TJUserCenterItemModel.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^actionbBlock)(void);
@interface TJUserCenterItemModel : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *imageName;
@property (nonatomic,copy) actionbBlock block;

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName block:(actionbBlock )block;
@end

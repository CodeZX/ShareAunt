//
//  TJSettingItemModel.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/13.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^actionbBlock)(void);


typedef NS_ENUM(NSUInteger, TJSettingItemAccessoryType) {
    TJSettingItemAccessoryTypeDefault,
    TJSettingItemAccessoryTypeIndicator,
    TJSettingItemAccessoryTypeSwitch,
};
@interface TJSettingItemModel : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,assign) TJSettingItemAccessoryType accessoryType;
@property (nonatomic,copy) actionbBlock block;
- (instancetype)initWithTitle:(NSString *)title  accessoryType:(TJSettingItemAccessoryType) accessoryType block:(actionbBlock)block;
@end

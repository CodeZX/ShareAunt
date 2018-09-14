//
//  TJPersonalInformationItemModel.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/13.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^actionbBlock)(void);

typedef NS_ENUM(NSUInteger, TJPersonalInformationAccessoryType) {
    TJSettingItemAccessoryTypeDefault,
    TJSettingItemAccessoryTypeNone,
    TJSettingItemAccessoryTypeIndicator,
//    TJSettingItemAccessoryTypeSwitch,
};

@interface TJPersonalInformationItemModel : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *rightTitle;
@property (nonatomic,assign) TJPersonalInformationAccessoryType accessoryType;
@property (nonatomic,copy) actionbBlock block;
- (instancetype)initWithTitle:(NSString *)title rightTitle:(NSString *)rightTitle accessoryType:(TJPersonalInformationAccessoryType) accessoryType block:(actionbBlock)block;
@end

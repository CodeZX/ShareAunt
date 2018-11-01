//
//  TJModeSettingRealTime.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/21.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@class TJModeSettingRealTimeView;
@protocol  TJModeSettingRealTimeViewDelegate <NSObject>
@optional
- (void)modeSettingRealTimeView:(TJModeSettingRealTimeView *)modeSettingRealTimeView didAreaSelect:(UIButton *)AreaSelectBtn;
@required
@end
@interface TJModeSettingRealTimeView : UIView
@property (nonatomic,weak) id<TJModeSettingRealTimeViewDelegate> delegate;

- (NSDictionary *)getArea;
@end

NS_ASSUME_NONNULL_END

//
//  TJUserCenterheaderView.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TJUserCenterHeaderView;
@protocol  TJUserCenterHeaderViewDelegate <NSObject>
@optional
- (void)userCenterHeaderView:(TJUserCenterHeaderView *)userCenterHeaderView didPortraitClicked:(UIImageView *)portraitImageV;
@required
@end
@interface TJUserCenterHeaderView : UIView

@property (nonatomic,weak) id<TJUserCenterHeaderViewDelegate> delegate;
@end

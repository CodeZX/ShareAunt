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
- (void)userCenterHeaderView:(TJUserCenterHeaderView *)userCenterHeaderView didLogInClicked:(UIButton *)notLogBtn;
- (void)userCenterHeaderView:(TJUserCenterHeaderView *)userCenterHeaderView didPortraitClicked:(UIImageView *)portraitImageV;
- (void)userCenterHeaderView:(TJUserCenterHeaderView *)userCenterHeaderView didOrderClicked:(UIButton *)orderBtn;
- (void)userCenterHeaderView:(TJUserCenterHeaderView *)userCenterHeaderView didWalletClicked:(UIButton *)walletBtn;
@required
@end
@interface TJUserCenterHeaderView : UIView

@property (nonatomic,weak) id<TJUserCenterHeaderViewDelegate> delegate;
@property (nonatomic,strong) userModel *userModel;

- (void)upDateUI;
@end

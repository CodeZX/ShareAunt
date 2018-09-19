//
//  TJHomeToolBar.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/19.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TJHomeToolBar;
@protocol  TJHomeToolBarDelegate <NSObject>
@optional
- (void)homeToolBar:(TJHomeToolBar *)homeToolBar didTapMode:(UIButton *)modeBtn;
- (void)homeToolBar:(TJHomeToolBar *)homeToolBar didTapReceivingrders:(UIButton *)receivingrdersBtn;
@required
@end

@interface TJHomeToolBar : UIView
@property (nonatomic,weak) id<TJHomeToolBarDelegate> delegate;

@end

//
//  TJVerificationCodeButton.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/11.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJVerificationCodeButton : UIButton
// 由于有些时间需求不同，特意露出方法，倒计时时间次数
- (void)timeFailBeginFrom:(NSInteger)timeCount;
@end

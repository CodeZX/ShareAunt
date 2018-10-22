//
//  TJTextView.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/10/11.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TJTextView : UITextView
- (instancetype)initWithPlaceholder:(NSString *)placeholder;
- (void)hidePlaceholder;
- (void)showPlaceholder;
@end

NS_ASSUME_NONNULL_END

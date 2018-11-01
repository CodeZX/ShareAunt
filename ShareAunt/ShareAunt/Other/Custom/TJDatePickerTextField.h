//
//  TJDatePickerTextField.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/10/22.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TJDatePickerTextField;
@protocol  TJDatePickerTextFieldDelegate <NSObject>
@optional
- (void)didCancelClickedForDatePickerTextField:(TJDatePickerTextField *)textField;
- (void)datePickerTextField:(TJDatePickerTextField *)textField didAffirmClicked:(NSString *)time;
- (void)datePickerTextField:(TJDatePickerTextField *)textField didChange:(NSString *)time;
@required
@end

@interface TJDatePickerTextField : UITextField
@property (nonatomic,weak) id<TJDatePickerTextFieldDelegate> TJDelegate;
@property (nonatomic,strong,readonly) NSDate *date;
@end

NS_ASSUME_NONNULL_END

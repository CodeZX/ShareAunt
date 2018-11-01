//
//  TJDatePickerTextField.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/10/22.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJDatePickerTextField.h"


@interface TJDatePickerTextField ()

@end

@implementation TJDatePickerTextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,200)];
    // datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    self.inputView = datePicker;
    UIToolbar *accessoryView = [[UIToolbar alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,40)];
    UIBarButtonItem *flex = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(flexDidClicked)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(rightDidClicked)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    accessoryView.items = @[flex,space,right];
    self.inputAccessoryView = accessoryView;
}

- (void)dateChange:(UIDatePicker *)datePicker {
    
    _date = datePicker.date;
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd hh:mm"];
    NSString *dateStr =[dateFormat stringFromDate:datePicker.date];
    self.text = dateStr;
    if ([self.TJDelegate respondsToSelector:@selector(datePickerTextField:didChange:)]) {
        [self.TJDelegate datePickerTextField:self didChange:dateStr];
    }

}


- (void)flexDidClicked {
    
    [self resignFirstResponder];
    if ([self.TJDelegate respondsToSelector:@selector(didCancelClickedForDatePickerTextField:)]) {
        [self.TJDelegate didCancelClickedForDatePickerTextField:self];
    }
}

- (void)rightDidClicked {
    
   [self resignFirstResponder];
    if ([self.TJDelegate respondsToSelector:@selector(datePickerTextField:didAffirmClicked:)]) {
        [self.TJDelegate datePickerTextField:self didAffirmClicked:self.text];
    }
    
}

@end

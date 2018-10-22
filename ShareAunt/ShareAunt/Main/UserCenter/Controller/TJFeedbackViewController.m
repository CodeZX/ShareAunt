//
//  TJFeedbackViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/10/11.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJFeedbackViewController.h"
#import "TJTextView.h"

@interface TJFeedbackViewController ()<UITextViewDelegate>
@property (nonatomic,weak) TJTextView *feedbackTextV;
@end

@implementation TJFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    
    self.title = @"意见反馈";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    TJTextView *feedbackTextV = [[TJTextView alloc]initWithPlaceholder:@"说点什么吧......"];
    feedbackTextV.delegate = self;
//    feedbackTextV.backgroundColor = [UIColor redColor];
    [self.view addSubview:feedbackTextV];
    self.feedbackTextV  = feedbackTextV;
    [self.feedbackTextV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(10);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(100);
    }];
    
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
//    if (self.feedbackTextV.text.length == 0) {
//        [self.feedbackTextV showPlaceholder];
//    }else {
//        [self.feedbackTextV hidePlaceholder];
//    }
    [self.feedbackTextV hidePlaceholder];
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    [self.feedbackTextV showPlaceholder];
    return YES;
}

@end

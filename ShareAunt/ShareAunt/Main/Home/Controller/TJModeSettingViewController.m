//
//  TJModeSettingViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/19.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJModeSettingViewController.h"
#import "TJModeSettingRealTimeView.h"
#import "TJModeSettingBespeakView.h"
#import "TJModeSettingAllView.h"
#import "TJAreaSelectViewController.h"

@interface TJModeSettingViewController ()<TJModeSettingRealTimeViewDelegate>

@property (nonatomic,weak) UILabel *titleLab;
@property (nonatomic,weak) UISegmentedControl *segment;
@property (nonatomic,weak) UIButton *saveBtn;

@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,strong) TJModeSettingRealTimeView *realTimeView;
@property (nonatomic,strong) TJModeSettingBespeakView *bespeakView;
@property (nonatomic,strong) TJModeSettingAllView *allView;
@end

@implementation TJModeSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
     [self setupUI];
     
}

- (void)segmentChange:(UISegmentedControl *)segment {
    switch (segment.selectedSegmentIndex) {
        case 0:
        {
            [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 0, 0) animated:YES];
          break;
        }
        case 1:
        {
            [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 1, 0) animated:YES];
            break;
        }
        case 2:
        {
            [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 2, 0) animated:YES];
            break;
        }
            
        default:
            break;
    }
    
}
 - (void)setupUI {
     
     self.title = @"模式设置";
     self.view.backgroundColor = MOTIf_BACKGROUND_COLOR;
     __weak typeof(self) weakSelf = self;
     
     
     UILabel *titleLab = [UILabel labelWithText:@"订单类型" textColor:[UIColor jk_colorWithHex:0xDADADD] fontName:@"PingFangSC-Light" fontSize:14 wordSpace:5];
     [self.view addSubview:titleLab];
     self.titleLab = titleLab;
     [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(weakSelf.view).offset(0);
         make.centerX.equalTo(weakSelf.view);
     }];
     
     //先生成存放标题的数据
     NSArray *array = [NSArray arrayWithObjects:@"实时",@"预约",@"全部", nil];
     //初始化UISegmentedControl
     UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:array];
     [segment setSelectedSegmentIndex:0];
     // 去掉颜色,现在整个segment偶看不到,可以相应点击事件
     segment.tintColor = [UIColor clearColor];
     
     // 正常状态下
     NSDictionary * normalTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16.0f],NSForegroundColorAttributeName : [UIColor jk_colorWithHex:0x909090]};
     [segment setTitleTextAttributes:normalTextAttributes forState:UIControlStateNormal];
     
     // 选中状态下
     NSDictionary * selctedTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:20.0f],NSForegroundColorAttributeName : MOTIF_BUTTON_COLOR};
     [segment setTitleTextAttributes:selctedTextAttributes forState:UIControlStateSelected];
     
     segment.layer.cornerRadius = 23;
     segment.layer.masksToBounds = YES;
//     segment.layer.borderColor = [UIColor redColor].CGColor;
//     segment.layer.borderWidth = 1;
     segment.backgroundColor = [UIColor jk_colorWithHex:0x25252F];
//     segment.tintColor = [UIColor jk_colorWithHex:0x909090];
     [segment addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
     
     
     //添加到视图
     [self.view addSubview:segment];
     self.segment = segment;
     [segment mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(titleLab.bottom).offset(5);
         make.left.equalTo(weakSelf.view.right).multipliedBy(SCALE_k(30, 375));
         make.right.equalTo(weakSelf.view.right).multipliedBy(1 - SCALE_k(30, 375));
         make.height.equalTo(segment.width).multipliedBy(SCALE_H(316, 45));;
     }];
     
     
     [self setupScrollView];
     
     UIButton *saveBtn = [UIButton TJ_buttonWithTitle:@"保存设置" titleColor:[UIColor whiteColor] titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:16] backgroundColor:MOTIF_BUTTON_COLOR];
     saveBtn.layer.cornerRadius = 5;
     saveBtn.layer.masksToBounds = YES;
     [self.view addSubview:saveBtn];
     self.saveBtn = saveBtn;
     [self.saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(weakSelf.view.right).multipliedBy(SCALE_k(30, 375));
         make.right.equalTo(weakSelf.view.right).multipliedBy(1 - SCALE_k(30, 375));
         make.height.equalTo(saveBtn.width).multipliedBy(SCALE_H(316, 50));;
         make.bottom.equalTo(weakSelf.view).offset(iPhoneX?-34:0);

     }];
     
 }

- (void)setupScrollView {
    
    __weak typeof(self) weakSelf = self;
    UIScrollView *scrollView = [[UIScrollView alloc]init];
//    scrollView.backgroundColor = [UIColor yellowColor];
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, 300);
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.segment.bottom).offset(10);
        make.left.right.equalTo(weakSelf.view);
//        make.bottom.equalTo(weakSelf.saveBtn.top).offset(-30);
        make.height.equalTo(SCREEN_HEIGHT - SIZE_NAVBAR_HEIGHT);
    }];
    
    UIView *containerView = [[UIView alloc]init];
    containerView.backgroundColor = MOTIf_BACKGROUND_COLOR;
    [self.scrollView addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(scrollView);
        make.height.equalTo(scrollView.height);

    }];
    
    [containerView addSubview:self.realTimeView];
    [self.realTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(containerView);
        make.height.equalTo(containerView.height);
        make.width.equalTo(SCREEN_WIDTH);
    }];
    
    [containerView addSubview:self.bespeakView];
    [self.bespeakView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.realTimeView.right);
        make.top.equalTo(weakSelf.realTimeView.top);
        make.bottom.equalTo(weakSelf.realTimeView.bottom);
        make.width.equalTo(SCREEN_WIDTH);
    }];
    
    
    [containerView addSubview:self.allView];
    [self.allView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bespeakView.right);
        make.top.equalTo(weakSelf.bespeakView.top);
        make.bottom.equalTo(weakSelf.bespeakView.bottom);
        make.width.equalTo(SCREEN_WIDTH);
    }];
    
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.allView.right);
    }];
    
    
    
}
#pragma mark -------------------------- Delegate ----------------------------------------
#pragma mark TJModeSettingRealTimeViewDelegate
- (void)modeSettingRealTimeView:(TJModeSettingRealTimeView *)modeSettingRealTimeView didAreaSelect:(UIButton *)AreaSelectBtn {
    
    TJAreaSelectViewController *VC = [[TJAreaSelectViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark -------------------------- lazy load ----------------------------------------

- (TJModeSettingRealTimeView *)realTimeView {
    if (!_realTimeView) {
//        CGFloat X,Y,W,H;
//        X = 0;
//        Y = 200;
//        W = SCREEN_WIDTH;
//        H = 200;
        _realTimeView  = [[TJModeSettingRealTimeView alloc]init];
        _realTimeView.delegate = self;
//        [self.view addSubview:_realTimeView];
        
    }
    return _realTimeView;
}

- (TJModeSettingBespeakView *)bespeakView {
    if (!_bespeakView) {
        _bespeakView = [[TJModeSettingBespeakView alloc]init];
    }
    return _bespeakView;
}

- (TJModeSettingAllView *)allView {
    if (!_allView) {
        _allView = [[TJModeSettingAllView alloc]init];
    }
    return _allView;
}



@end

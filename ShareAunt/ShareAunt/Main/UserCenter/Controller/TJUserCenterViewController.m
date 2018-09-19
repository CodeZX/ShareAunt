//
//  TJUserCenterViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/10.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJUserCenterViewController.h"
#import "TJUserCenterheaderView.h"
#import "TJUserCenterTableViewCell.h"
#import "TJUserCenterItemModel.h"
#import "TJSettingViewController.h"
#import "TJPersonalInformationViewController.h"
#import "TJCertificationMaterialsViewController.h"



@interface TJUserCenterViewController ()<UITableViewDelegate,UITableViewDataSource,TJUserCenterHeaderViewDelegate>
@property (nonatomic,weak) TJBasicTableView *tableView;
@property (nonatomic,strong) NSArray *items;

@end

@implementation TJUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage jk_imageWithColor:MOTIf_BACKGROUND_COLOR] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)setupUI {
    
//    self.title = @"我的";
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClicked:)];
    
    
    TJBasicTableView *tableView = [[TJBasicTableView alloc]init];
    tableView.backgroundColor = [UIColor jk_colorWithHex:0xEFEFEF];
    tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    tableView.delegate  = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    TJUserCenterHeaderView *headerView = [[TJUserCenterHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH *SCALE_H(375, 278))];
    headerView.delegate = self;
    self.tableView.tableHeaderView = headerView;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    
    
}

- (void)rightBarButtonClicked:(id)sender {
    
    TJSettingViewController *settingVC = [[TJSettingViewController alloc]init];
    [self.navigationController pushViewController:settingVC animated:YES];
    
}


#pragma mark -------------------------- Delegate ----------------------------------------
#pragma mark UITableViewSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Identifier";
    TJUserCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TJUserCenterTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];

    }
    cell.itemModel = self.items[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TJUserCenterItemModel *itemModel = self.items[indexPath.row];
    itemModel.block();
}

#pragma mark -------------------------- Delegate ----------------------------------------
#pragma mark TJUserCenterHeaderViewDelegate
- (void)userCenterHeaderView:(TJUserCenterHeaderView *)userCenterHeaderView didPortraitClicked:(UIImageView *)portraitImageV {
    
    TJPersonalInformationViewController *VC = [[TJPersonalInformationViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
    
}


#pragma mark -------------------------- lazy load ----------------------------------------
- (NSArray *)items {
    __weak typeof(self) weakSelf = self;
    if (!_items) {
        
        _items = @[ [[TJUserCenterItemModel alloc]initWithTitle:@"认证资料" imageName:@"data" block:^{
            
            DEBUG_LOG(@"%@",@"认证资料");
            TJCertificationMaterialsViewController *VC  =  [[TJCertificationMaterialsViewController alloc]init];
            [weakSelf.navigationController pushViewController:VC animated:YES];

                    }],
                    
                    [[TJUserCenterItemModel alloc]initWithTitle:@"客服中心" imageName:@"service" block:^{
                        
                    }],
                    
                    [[TJUserCenterItemModel alloc]initWithTitle:@"推荐有奖" imageName:@"gift" block:^{
                        
                    }],
                    
                    [[TJUserCenterItemModel alloc]initWithTitle:@"阿姨升级" imageName:@"upgrade" block:^{
                        
                    }],
                   ];
    }
    return _items;
}


@end

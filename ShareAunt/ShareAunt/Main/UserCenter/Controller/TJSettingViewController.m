//
//  TJSettingViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/13.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJSettingViewController.h"
#import "TJSettingItemModel.h"
#import "TJSettingTableViewCell.h"
#import "TJUserCenterHeaderView.h"
#import "TJMendPhoneNumberViewController.h"
@interface TJSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) TJBasicTableView *tableView;
@property (nonatomic,strong) NSArray *items;
@property (nonatomic,strong) NSArray *sectionArray;
@property (nonatomic,weak) UIButton *signOutBtn;
@end

@implementation TJSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage jk_imageWithColor:MOTIf_BACKGROUND_COLOR] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)setupUI {
    
    self.title  = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    TJBasicTableView *tableView = [[TJBasicTableView alloc]init];
    tableView.backgroundColor = [UIColor jk_colorWithHex:0xEFEFEF];
//    tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    tableView.delegate  = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
//    TJUserCenterHeaderView *headerView = [[TJUserCenterHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH *SCALE_H(375, 278))];
//    self.tableView.tableHeaderView = headerView;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    
    
    UIButton *signOutBtn = [UIButton TJ_buttonWithTitle:@"退出登录" titleColor:[UIColor whiteColor] titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15] backgroundColor:MOTIF_BUTTON_COLOR];
    [self.view addSubview:signOutBtn];
    self.signOutBtn = signOutBtn;
    [self.signOutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view).offset(-SCREEN_HEIGHT * SCALE_Y(44) - (iPhoneX?34:0));
        make.left.equalTo(weakSelf.view).offset(30);
        make.right.equalTo(weakSelf.view).offset(-30);
        make.height.equalTo(44);
    }];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------------------- Delegate ----------------------------------------
#pragma mark UITableViewSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *items = self.sectionArray[section];
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"TJSettingTableViewCell";
    TJSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TJSettingTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        
    }
    NSArray *items = self.sectionArray[indexPath.section];
    cell.itemModel = items[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return 0;
    }
    return 20;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return [[UIView alloc]init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section  {
    
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section  {
    
    return [[UIView alloc]init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    NSArray *items = self.sectionArray[indexPath.section];
    TJSettingItemModel *itemModel = items[indexPath.row];
    itemModel.block();
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.separatorInset = UIEdgeInsetsZero;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *items = self.sectionArray[indexPath.section];
    TJSettingItemModel *item = items[indexPath.row];
    if ( item.accessoryType != TJSettingItemAccessoryTypeSwitch) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
//    cell.layoutMargins = UIEdgeInsetsZero;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//
//}

#pragma mark -------------------------- lazy  load ----------------------------------------
//- (NSArray *)items {
//    if (!_items) {
//        __weak typeof(self) weakSelf = self;
//        _items = @[ [[TJSettingItemModel alloc]initWithTitle:@"修改密码" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
//
//                   }],
//                    [[TJSettingItemModel alloc]initWithTitle:@"修改手机号" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
//
//                        NSLog(@"%@",@"修改手机号码");
//                        TJMendPhoneNumberViewController *VC = [[TJMendPhoneNumberViewController alloc]init];
//                        [weakSelf.navigationController pushViewController:VC animated:YES];
//                    }],
//                    [[TJSettingItemModel alloc]initWithTitle:@"消息自动语音播报" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
//
//                    }],
//                    [[TJSettingItemModel alloc]initWithTitle:@"意见反馈" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
//
//                    }],
//                    [[TJSettingItemModel alloc]initWithTitle:@"联系我们" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
//
//                    }],
//                    [[TJSettingItemModel alloc]initWithTitle:@"关于我们" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
//
//                    }]
//
//
//                ];
//    }
//    return _items;
//}

- (NSArray *)sectionArray {
    if (!_sectionArray) {
        __weak typeof(self) weakSelf = self;
        
        NSArray *item0 = @[ [[TJSettingItemModel alloc]initWithTitle:@"修改密码" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
            
                            }],
                          [[TJSettingItemModel alloc]initWithTitle:@"修改手机号" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
                              TJMendPhoneNumberViewController *VC = [[TJMendPhoneNumberViewController alloc]init];
                              [weakSelf.navigationController pushViewController:VC animated:YES];
                            }]
                            ];
        NSArray *item1 = @[
                           [[TJSettingItemModel alloc]initWithTitle:@"消息自动语音播报" accessoryType:TJSettingItemAccessoryTypeSwitch block:^{
                               
                           }]
                           ];
        NSArray *item2 = @[
                           [[TJSettingItemModel alloc]initWithTitle:@"意见反馈" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
                               
                           }],
                           [[TJSettingItemModel alloc]initWithTitle:@"联系我们" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
                               
                           }],
                           [[TJSettingItemModel alloc]initWithTitle:@"关于我们" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
                               
                           }]
                           ];
        
        
        _sectionArray = @[item0,item1,item2];
    }
    return _sectionArray;
}


@end

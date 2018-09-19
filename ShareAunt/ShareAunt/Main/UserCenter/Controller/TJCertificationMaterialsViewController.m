//
//  TJCertificationMaterialsViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/18.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJCertificationMaterialsViewController.h"
#import "TJCertificationMaterialsTableViewCell.h"
#import "TJCertificationMaterialsItemModel.h"
#import "TJCertificationMaterialsFooterView.h"

@interface TJCertificationMaterialsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) TJBasicTableView *tableView;
@property (nonatomic,strong) NSArray *items;
@end

@implementation TJCertificationMaterialsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


- (void)setupUI {
    
    self.title = @"认证资料";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    TJBasicTableView *tableView = [[TJBasicTableView alloc]init];
    tableView.backgroundColor = [UIColor jk_colorWithHex:0xEFEFEF];
    //    tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    tableView.delegate  = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    TJCertificationMaterialsFooterView *footerView = [[TJCertificationMaterialsFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*SCALE_H(375, 446))];
    self.tableView.tableFooterView = footerView;
    //    TJUserCenterHeaderView *headerView = [[TJUserCenterHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH *SCALE_H(375, 278))];
    //    self.tableView.tableHeaderView = headerView;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    
}
#pragma mark -------------------------- Delegate ----------------------------------------
#pragma mark UITableViewSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    NSArray *items = self.items[section];
//    return items.count;
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"TJSettingTableViewCell";
    TJCertificationMaterialsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TJCertificationMaterialsTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        
    }
   
    cell.itemModel = self.items[indexPath.row];
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
    
    
//    NSArray *items = self.sectionArray[indexPath.section];
//    TJSettingItemModel *itemModel = items[indexPath.row];
//    itemModel.block();
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.separatorInset = UIEdgeInsetsZero;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

}

#pragma mark -------------------------- lazy load ----------------------------------------
- (NSArray *)items {
    if (!_items) {
        _items = @[  [[TJCertificationMaterialsItemModel alloc]initWithTitle:@"张三"],
                     [[TJCertificationMaterialsItemModel alloc]initWithTitle:@"手机号码"],
                     [[TJCertificationMaterialsItemModel alloc]initWithTitle:@"身份证号"],
                   ];
    }
    return _items;
}

@end

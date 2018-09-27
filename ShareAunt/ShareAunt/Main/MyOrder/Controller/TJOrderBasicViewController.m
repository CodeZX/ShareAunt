//
//  TJOrderBasicViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/26.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJOrderBasicViewController.h"
#import "TJOrderBasicTableViewCell.h"
#import "TJOrderModel.h"
#import "TJOrderDetailedViewController.h"

@interface TJOrderBasicViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation TJOrderBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor jk_colorWithHex:0xEFEFEF];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    tableView.contentInset = UIEdgeInsetsMake(40, 0, 100, 0);
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark -------------------------- Delegate ----------------------------------------
#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
  return  self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 158;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"TJOrderBasicTableViewCell";
    TJOrderBasicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TJOrderBasicTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TJOrderDetailedViewController *VC = [[TJOrderDetailedViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource =  [[NSMutableArray alloc]initWithArray:@[
                                                              [[TJOrderModel alloc]init],
                                                              [[TJOrderModel alloc]init],
                                                              [[TJOrderModel alloc]init],
                                                              [[TJOrderModel alloc]init],
                                                               [[TJOrderModel alloc]init],
                                                               [[TJOrderModel alloc]init],
                                                               [[TJOrderModel alloc]init],
                                                               [[TJOrderModel alloc]init],
                                                               [[TJOrderModel alloc]init]
                                                              ]];
    }
    return _dataSource;
}

@end

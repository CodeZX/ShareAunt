//
//  TJPersonalInformationViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/13.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJPersonalInformationViewController.h"
#import "TJPersonalInformationItemModel.h"
#import "TJPersonalInformationTableViewCell.h"

@interface TJPersonalInformationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) TJBasicTableView *tableView;
@property (nonatomic,strong) UIView *footView;
@property (nonatomic,strong) NSArray *items;
//@property (nonatomic,strong) NSArray *sectionArray;
@property (nonatomic,weak) UIButton *saveBtn;

@end

@implementation TJPersonalInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


- (void)setupUI {
    
    self.title = @"个人资料";
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
    self.tableView.tableFooterView = self.footView;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    
    
    UIButton *saveBtn = [UIButton TJ_buttonWithTitle:@"保存设置" titleColor:[UIColor whiteColor] titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15] backgroundColor:MOTIF_BUTTON_COLOR];
    [saveBtn addTarget:self action:@selector(saveBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
    self.saveBtn = saveBtn;
    [self.saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view).offset(-SCREEN_HEIGHT * SCALE_Y(44) - (iPhoneX?34:0));
        make.left.equalTo(weakSelf.view).offset(30);
        make.right.equalTo(weakSelf.view).offset(-30);
        make.height.equalTo(44);
    }];
    
}

- (void)saveBtnClicked:(UIButton *)btn {
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    static NSString *identifier = @"TJPersonalInformationTableViewCell";
    TJPersonalInformationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TJPersonalInformationTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        
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
    
    TJPersonalInformationItemModel *itemModel = self.items[indexPath.row];
    itemModel.block();
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.separatorInset = UIEdgeInsetsZero;
    TJPersonalInformationItemModel *itemModel = self.items[indexPath.row];
    if ( itemModel.accessoryType != TJSettingItemAccessoryTypeNone) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
//        cell.layoutMargins = UIEdgeInsetsZero;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//
//}

#pragma mark -------------------------- lazy  load ----------------------------------------
- (NSArray *)items {
    if (!_items) {
        _items = @[ [[TJPersonalInformationItemModel alloc]initWithTitle:@"头像" rightTitle:@"待审核" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
            
                    }],
                    [[TJPersonalInformationItemModel alloc]initWithTitle:@"姓名" rightTitle:@"张三" accessoryType:TJSettingItemAccessoryTypeNone block:^{
                        
                    }],
                    [[TJPersonalInformationItemModel alloc]initWithTitle:@"手机号码" rightTitle:@"1234567890" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
                        
                    }],
                    [[TJPersonalInformationItemModel alloc]initWithTitle:@"身份证号" rightTitle:@"32128*******9612" accessoryType:TJSettingItemAccessoryTypeIndicator block:^{
                        
                    }],
                    
                    
                    ];
    }
    return _items;
}

- (UIView *)footView {
    if (!_footView) {
        _footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT
                                                            * SCALE_Y(129))];
        _footView.backgroundColor = [UIColor whiteColor];
        UILabel *titleLab = [UILabel labelWithText:@"个人介绍" textColor:[UIColor jk_colorWithHex:0x272727] fontName:@"PingFangSC-Regular" fontSize:15 wordSpace:4];
        [_footView addSubview:titleLab];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->_footView).offset(14);
            make.top.equalTo(self->_footView).offset(15);
        }];
        
        UITextView *textView = [[UITextView alloc]init];
        textView.layer.borderColor = [UIColor jk_colorWithHex:0xE1E1E1].CGColor;
        textView.layer.borderWidth = 1;
        [_footView addSubview:textView];
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLab.bottom).offset(12);
            make.left.equalTo(titleLab);
            make.right.equalTo(self->_footView).offset(-14);
            make.bottom.equalTo(self->_footView).offset(-12);
        }];
        
    }
    return _footView;
}

@end

//
//  TJAreaSelectViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/25.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJAreaSelectViewController.h"
#import "TJAreaSelectCollectionViewCell.h"
#import "TJAreaSelectItemModel.h"

@interface TJAreaSelectViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

static NSString *identifier = @"TJAreaSelectCollectionViewCell";
@implementation TJAreaSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupUI];
}


- (void)setupUI {
    
    self.title = @"选择区域";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    UILabel *titleLab = [UILabel labelWithText:@"点击选择您想要去的区域，将听取所选区域的订单" textColor:[UIColor jk_colorWithHex:0x909090] fontName:@"PingFang-SC-Regular" fontSize:11 wordSpace:0];
    [self.view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(15);
        make.left.equalTo(weakSelf.view).offset(15);
        
    }];
    
    
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 44);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.contentInset = UIEdgeInsetsMake(40, 15, 0, 15);
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    [self.view sendSubviewToBack:collectionView];
    self.collectionView = collectionView;
    [self.collectionView registerClass:[TJAreaSelectCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    
}

#pragma mark -------------------------- Delegata ----------------------------------------
#pragma mark UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TJAreaSelectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.itemModel = self.dataSource[indexPath.row];
    return cell;
}


#pragma mark -------------------------- lazy load ----------------------------------------
- (NSMutableArray *)dataSource {
    if (!_dataSource) {

        _dataSource = [[NSMutableArray alloc]initWithArray: @[ [[TJAreaSelectItemModel alloc]initWithTitle:@"上海-奉贤"],
                                                    [[TJAreaSelectItemModel alloc]initWithTitle:@"上海-闵行"],
                                                               [[TJAreaSelectItemModel alloc]initWithTitle:@"上海-浦东"],
                                                               [[TJAreaSelectItemModel alloc]initWithTitle:@"上海-宝山"],
                                                               [[TJAreaSelectItemModel alloc]initWithTitle:@"上海-松江"],
                                                               [[TJAreaSelectItemModel alloc]initWithTitle:@"上海-嘉定"],
                                                               [[TJAreaSelectItemModel alloc]initWithTitle:@"上海-金山"],
                                                               [[TJAreaSelectItemModel alloc]initWithTitle:@"上海-崇明"],
                                                               [[TJAreaSelectItemModel alloc]initWithTitle:@"上海-青浦"],
                                                               [[TJAreaSelectItemModel alloc]initWithTitle:@"上海-外环内"],
                                                               
                                                              ]];
    }
    return _dataSource;
}
@end

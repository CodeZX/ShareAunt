//
//  TJHomeViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/10.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJHomeViewController.h"
#import "TJHomeToolBar.h"
#import "TJHomeCollectionViewCell.h"
#import "TJOrderModel.h"
#import "TJHomeHeaderView.h"
#import "TJModeSettingViewController.h"


static NSString *identifier = @"TJHomeCollectionViewCell";
@interface TJHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,TJHomeToolBarDelegate>

@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *dataSource;

@end

@implementation TJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    self.navigationController.navigationBar.hidden = YES;
}

- (void)setupUI {
    
    
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self setAdditionalSafeAreaInsets:UIEdgeInsetsMake(0, 0, -70, 0)];
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"useravatar"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarBauttonClicked:)];
//
    __weak typeof(self) weakSelf = self;
    TJHomeHeaderView *headerView = [[TJHomeHeaderView alloc]init];
    [self.view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(weakSelf.view);
        make.height.equalTo(headerView.width).multipliedBy(SCALE_H(375, 250));
       
    }];
    
////    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
////    layout.itemSize = CGSizeMake(SCREEN_WIDTH , SCREEN_WIDTH *SCALE_H(357, 253));
////     layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
////    //    layout.minimumLineSpacing = 0;
////    CGFloat X,Y,W,H;
////    X = 0;
////    Y = SCREEN_WIDTH * SCALE_H(375, 250);
////    W = SCREEN_WIDTH;
////    H = SCREEN_WIDTH *SCALE_H(357, 253);
////    UICollectionView *collecttionView = [[UICollectionView alloc]initWithFrame:CGRectMake(X, Y, W, H) collectionViewLayout:layout];
////    collecttionView.backgroundColor = [UIColor whiteColor];
////    collecttionView.delegate = self;
////    collecttionView.dataSource = self;
//////    collecttionView.contentInset = UIEdgeInsetsMake(20, 15, 0, 15);
////    [self.view addSubview:collecttionView];
////    self.collectionView = collecttionView;
////        self.collectionView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
////        [self.collectionView.mj_header beginRefreshing];
//    [self.collectionView registerClass:[TJHomeCollectionViewCell class] forCellWithReuseIdentifier:identifier];
////    [self.collectionView registerClass:[TJHomeHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TJHomeHeaderView"];
////    [self.collectionView registerClass:[TJHomeToolBar class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"TJHomeToolBar"];
    
    
    TJHomeToolBar *toolBar = [[TJHomeToolBar alloc]init];
    toolBar.delegate = self;
    [self.view addSubview:toolBar];
    [toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view.bottom).offset(-88);
//        make.height.equalTo(toolBar.width).multipliedBy(SCALE_H(375, 100));
        make.height.equalTo(100);
    }];
    
    
}


#pragma mark -------------------------- Delegate ----------------------------------------
#pragma mark UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TJHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: identifier forIndexPath:indexPath];
    //    cell.sortModel = self.dataSource[indexPath.row];
    cell.orderModel = self.dataSource[indexPath.row];
    cell.backgroundColor = [UIColor yellowColor];
    return  cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //    if ([self.delegate respondsToSelector:@selector(musicHeaderView:didSelectedAlias:)]) {
    //        MusicHeaderViewItemModel *itemModel = self.dataSource[indexPath.row];
    //        [self.delegate musicHeaderView:self didSelectedAlias:itemModel.type_alias];
    //
    //    }
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//       return  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TJHomeHeaderView" forIndexPath:indexPath];
//    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
//        return  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"TJHomeToolBar" forIndexPath:indexPath];
//        
//    }
//    
//    return nil;
//}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    return CGSizeMake(SCREEN_WIDTH, 110);
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//    return CGSizeMake(SCREEN_WIDTH, 44);
//}


#pragma mark TJHomeToolBarDelegate
- (void)homeToolBar:(TJHomeToolBar *)homeToolBar didTapMode:(UIButton *)modeBtn {
    
    TJModeSettingViewController *VC = [[TJModeSettingViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}


- (void)homeToolBar:(TJHomeToolBar *)homeToolBar didTapReceivingrders:(UIButton *)receivingrdersBtn {
    
    
}






#pragma mark -------------------------- lazy load ----------------------------------------
- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[
                        [[TJOrderModel alloc]init],
                        [[TJOrderModel alloc]init],
                        [[TJOrderModel alloc]init],
                        [[TJOrderModel alloc]init],
                        [[TJOrderModel alloc]init],
                        [[TJOrderModel alloc]init],
                        [[TJOrderModel alloc]init],
                        [[TJOrderModel alloc]init],
                        ];
        
    }
    return _dataSource;
}




@end

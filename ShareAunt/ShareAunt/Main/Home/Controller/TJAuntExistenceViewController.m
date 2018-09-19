//
//  TJAuntExistenceViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/18.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJAuntExistenceViewController.h"
#import "TJAuntExistenceItemModel.h"
#import "TJAuntExistenceHeaderView.h"
#import "TJAuntExistenceFooterView.h"
#import "TJAuntExistenceCollectionViewCell.h"

static NSString *identifier = @"TJAuntExistenceCollectionViewCell";
@interface TJAuntExistenceViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *dataSource;
@end

@implementation TJAuntExistenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
    self.title = @"阿姨生活";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(80, 80);
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //    layout.minimumLineSpacing = 0;
    UICollectionView *collecttionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collecttionView.backgroundColor = [UIColor whiteColor];
    collecttionView.delegate = self;
    collecttionView.dataSource = self;
    //    collecttionView.contentInset = UIEdgeInsetsMake(20, 15, 0, 15);
    [self.view addSubview:collecttionView];
    self.collectionView = collecttionView;
    //        self.collectionView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    //        [self.collectionView.mj_header beginRefreshing];
    [self.collectionView registerClass:[TJAuntExistenceCollectionViewCell class] forCellWithReuseIdentifier:identifier];
        [self.collectionView registerClass:[TJAuntExistenceHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TJAuntExistenceHeaderView"];
        [self.collectionView registerClass:[TJAuntExistenceFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"TJAuntExistenceHeaderView"];
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
    
    TJAuntExistenceCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: identifier forIndexPath:indexPath];
    //    cell.sortModel = self.dataSource[indexPath.row];
//    cell.orderModel = self.dataSource[indexPath.row];
    cell.itemModel = self.dataSource[indexPath.row];
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
       return  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TJAuntExistenceHeaderView" forIndexPath:indexPath];
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        return  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"TJAuntExistenceHeaderView" forIndexPath:indexPath];

    }

    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(SCREEN_WIDTH, 110);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(SCREEN_WIDTH,110);
}


#pragma mark -------------------------- lazy load ----------------------------------------
- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[
                        [[TJAuntExistenceItemModel alloc]initWithTitle:@"家政礼仪" pictureName:@"etiquette"],
                        [[TJAuntExistenceItemModel alloc]initWithTitle:@"家政保洁" pictureName:@"clean"],
                        [[TJAuntExistenceItemModel alloc]initWithTitle:@"家庭膳食" pictureName:@"cooking"],
                        [[TJAuntExistenceItemModel alloc]initWithTitle:@"安全急救" pictureName:@"security"],
                        [[TJAuntExistenceItemModel alloc]initWithTitle:@"家电维护" pictureName:@"maintenance"],
                        
                        ];
        
    }
    return _dataSource;
}

@end

//
//  TJCertificationMaterialsFooterView.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/18.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJCertificationMaterialsFooterView.h"
#import "TJCertificationMaterialsFooterViewCell.h"
#import "TJCertificationMaterialsFooterViewItemModel.h"


@interface TJCertificationMaterialsFooterView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *dataSource;
@end


static NSString *identifier = @"TJCertificationMaterialsFooterViewCell";
@implementation TJCertificationMaterialsFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    __weak typeof(self) weakSelf = self;
    UIView *separateView = [[UIView alloc]init];
    separateView.backgroundColor = [UIColor jk_colorWithHex:0xE1E1E1];
    [self addSubview:separateView];
    [separateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(weakSelf);
        make.height.equalTo(10);
    }];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(150, 110);
    //    layout.minimumLineSpacing = 0;
    UICollectionView *collecttionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 10, self.frame.size.width, self.frame.size.height - 10) collectionViewLayout:layout];
    collecttionView.backgroundColor = [UIColor whiteColor];
    collecttionView.delegate = self;
    collecttionView.dataSource = self;
    collecttionView.contentInset = UIEdgeInsetsMake(20, 15, 0, 15);
    [self addSubview:collecttionView];
    self.collectionView = collecttionView;
    //    self.collectionView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    //    [self.collectionView.mj_header beginRefreshing];
    [self.collectionView registerClass:[TJCertificationMaterialsFooterViewCell class] forCellWithReuseIdentifier:identifier];
    
    
    UIButton *commitBtn = [UIButton TJ_buttonWithTitle:@"提交" titleColor:[UIColor whiteColor] titleFont:[UIFont fontWithName:@"PingFang-SC-Medium" size:15] backgroundColor:MOTIF_BUTTON_COLOR];
    commitBtn.layer.cornerRadius = 5;
    commitBtn.layer.masksToBounds = YES;
    [self addSubview:commitBtn];
    [commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.bottom).offset(-SCREEN_HEIGHT * SCALE_Y(65));
        make.left.equalTo(weakSelf).offset(SCREEN_WIDTH * SCALE_X(109));
        make.right.equalTo(weakSelf).offset(-SCREEN_WIDTH * SCALE_X(109));
        make.height.equalTo(commitBtn.width).multipliedBy(SCALE_H(157, 33));
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
    
    TJCertificationMaterialsFooterViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: identifier forIndexPath:indexPath];
    //    cell.sortModel = self.dataSource[indexPath.row];
    cell.itemModel = self.dataSource[indexPath.row];
    return  cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
//    if ([self.delegate respondsToSelector:@selector(musicHeaderView:didSelectedAlias:)]) {
//        MusicHeaderViewItemModel *itemModel = self.dataSource[indexPath.row];
//        [self.delegate musicHeaderView:self didSelectedAlias:itemModel.type_alias];
//
//    }
}


#pragma mark -------------------------- lazy load ----------------------------------------
- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[
                        [[TJCertificationMaterialsFooterViewItemModel alloc]initWithTitle:@"请上传身份证正面"],
                        [[TJCertificationMaterialsFooterViewItemModel alloc]initWithTitle:@"请上传身份证反面"],
                        [[TJCertificationMaterialsFooterViewItemModel alloc]initWithTitle:@"请上传从业资格证"],
                        [[TJCertificationMaterialsFooterViewItemModel alloc]initWithTitle:@"请上传牌照"],
                        
                        ];
        
    }
    return _dataSource;
}



@end

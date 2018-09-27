//
//  TJOrderBasicTableViewCell.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/26.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TJOrderModel;
@interface TJOrderBasicTableViewCell : UITableViewCell
@property (nonatomic,strong) TJOrderModel *orderModel;
@end

NS_ASSUME_NONNULL_END

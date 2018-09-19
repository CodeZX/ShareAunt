//
//  TJAuntExistenceItemModel.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/19.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJAuntExistenceItemModel : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *pictureName;
- (instancetype)initWithTitle:(NSString *)title pictureName:(NSString *)pictureName;
@end

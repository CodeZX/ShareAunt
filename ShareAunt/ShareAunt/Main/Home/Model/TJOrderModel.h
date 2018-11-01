//
//  TJOrderModel.h
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/19.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJOrderModel : NSObject
@property (nonatomic,strong) NSString *order_id;
@property (nonatomic,assign) NSUInteger order_type;
@property (nonatomic,assign) NSUInteger user_id;
@property (nonatomic,assign) NSUInteger aunt_id;
@property (nonatomic,strong) NSString *order_status;
@property (nonatomic,assign) NSUInteger goods_id;
@property (nonatomic,assign) CGFloat order_price;
@property (nonatomic,strong) NSString *create_time;
@property (nonatomic,strong) NSString *create_ip;
@property (nonatomic,strong) NSString *reserve_time;
@property (nonatomic,strong) NSString *take_time;
@property (nonatomic,strong) NSString *start_time;
@property (nonatomic,strong) NSString *end_time;
@property (nonatomic,strong) NSString *pay_time;
@property (nonatomic,assign) NSUInteger region_id;
@property (nonatomic,strong) NSString *order_address;
@property (nonatomic,strong) NSString *order_opinions;
@property (nonatomic,strong) NSString *order_opinions_level;
@property (nonatomic,strong) NSString *order_disabled;


@end


//"order_id": "tj0201810241107100_1",
//"order_type": 1,
//"user_id": 1,
//"aunt_id": null,
//"order_status": "1",
//"goods_id": 1,
//"order_price": 300,
//"create_time": "2018-10-24T03:05:05.000+0000",
//"create_ip": null,
//"reserve_time": null,
//"take_time": null,
//"start_time": "2018-10-24T03:05:11.000+0000",
//"end_time": "2018-10-24T05:05:15.000+0000",
//"pay_time": null,
//"region_id": 1,
//"order_address": "长宁区协和路787号B北618",
//"order_opinions": null,
//"order_opinions_level": null,
//"order_disabled": 1

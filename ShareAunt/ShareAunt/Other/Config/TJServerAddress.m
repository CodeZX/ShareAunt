//
//  XTJServerAddress.m
//  TJShop
//
//  Created by apple on 2018/3/2.
//  Copyright © 2018年 徐冬苏. All rights reserved.
//  网络请求接口

#import "TJServerAddress.h"

@implementation TJServerAddress

/** 接口根路径 */
#if NETWORK_ENVIRONMENT == 0
NSString * kHostURL = @"http://192.168.71.55:7090";
#else
NSString * kHostURL = @"http://192.168.71.55:7090";
#endif



#pragma mark - 登录
/** 密码登录接口 */
NSString * kLoginURL = @"/tunjin-cleaner/aunt/login_by_pwd";
/** 验证码登录接口 */
NSString * kLoginSmsURL = @"/tunjin-cleaner/user/loginBySms";
/** 注册接口 */
NSString * kRegisterURL = @"/tunjin-cleaner/aunt/register";
/** 获取验证码 */
NSString * kCAPTCHAURL = @"/tunjin-cleaner/messageApi/sendMessage";



#pragma mark - 首页
/**接单  */
NSString * kAcceptTaskURL = @"/tunjin-cleaner/aunt/listen_orders";


/**首页banner  */
NSString * kHomeBannerURL = @"/i_fashion/start_page/get_banner";
/**首页分类按钮  */
NSString * kHomeCategoryURL = @"/i_fashion/start_page/category";
/**首页推荐商品  */
NSString * kHomeListProductURL = @"/i_fashion/start_page/list_product";
/**分类  */
NSString * kCategoryGoodsURL = @"/i_fashion/category/list_product";
/**生产订单  */
NSString * kCreateOrderURL = @"/i_fashion/shopping/create_order";
/**选择地址  */
NSString * kAddressListURL = @"/i_fashion/address/select";
/**添加地址  */
NSString * kAddAddressURL = @"/i_fashion/address/add";
/**删除地址  */
NSString * kDeleteAddressURL = @"/i_fashion/address/delete";

#pragma mark - 购物车
/**购物车列表  */
NSString * kShoppingCartURL = @"/i_fashion/user/cart";
/**加入购物车  */
NSString * kAddToShoppingCartURL = @"/i_fashion/shopping/join_cart";
/**删除购物车  */
NSString * kDeleteShoppingCartURL = @"/i_fashion/shopping/delete_cart";



#pragma mark - 订单
/**ww全部订单  */
NSString * kAllOrderURL = @"/i_fashion/shopping/list_order";


#pragma mark - 收藏
/**商品收藏  */
NSString * kGoodsCollectURL = @"/i_fashion/user/collect";
/**加入收藏  */
NSString * kGoodsAddToCollectURL = @"/i_fashion/shopping/join_collect";
/**删除收藏  */
NSString * kDeleteCollectURL = @"/i_fashion/shopping/delete_collect";



#pragma mark - 消息

#pragma mark - 问一问

#pragma mark - 发布

#pragma mark - 我的
/**个人中心信息     */
NSString * kPersonalURL = @"/tunjin-cleaner/aunt/personal";
/**修改用户资料     */
NSString * kModifyUserInfoURL = @"/i_fashion/user/modify";
/**修改用户资料     */
NSString * kUploadPortraitURL = @"/i_fashion/user/upload";




@end

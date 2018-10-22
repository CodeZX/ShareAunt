//
//  userModel.h
//  TJShop
//
//  Created by 周鑫 on 2018/8/8.
//  Copyright © 2018年 徐冬苏. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, LogInType) {
    LogInTypepasword,
    LogInTypeSms,
    
};
@interface userModel : NSObject

@property (nonatomic,strong) NSString *aunt_id;
@property (nonatomic,strong) NSString *token;
@property (nonatomic,strong) NSString *aunt_name;
@property (nonatomic,strong) NSString *aunt_phone;
@property (nonatomic,strong) NSString *sex;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *face_url;
@property (nonatomic,strong) NSString *birthday;
@property (nonatomic,strong) NSString *aunt_company;
@property (nonatomic,strong) NSString *aunt_occupation;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *state;
@property (nonatomic,strong) NSString *validate;
@property (nonatomic,strong) NSString *pasword;
@property (nonatomic,assign) LogInType logInType;

@end



//"aunt_id":2,
//"aunt_name":"tom",
//"aunt_phone":"18827429191",
//"email":null,
//"face_url":null,
//"birthday":null,
//"sex":0,
//"aunt_company":null,
//"aunt_occupation":null,
//"type":0,
//"state":1,
//"validate":"1"

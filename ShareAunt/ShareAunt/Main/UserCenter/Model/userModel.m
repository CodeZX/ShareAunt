//
//  userModel.m
//  TJShop
//
//  Created by 周鑫 on 2018/8/8.
//  Copyright © 2018年 徐冬苏. All rights reserved.
//

#import "userModel.h"

@implementation userModel


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        
        self.aunt_id = [aDecoder decodeObjectForKey:@"aunt_id"];
        self.token = [aDecoder decodeObjectForKey:@"token"];
        self.aunt_name = [aDecoder decodeObjectForKey:@"aunt_name"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.face_url = [aDecoder decodeObjectForKey:@"face_url"];
        self.birthday = [aDecoder decodeObjectForKey:@"birthday"];
        self.aunt_company = [aDecoder decodeObjectForKey:@"aunt_company"];
        self.aunt_occupation = [aDecoder decodeObjectForKey:@"aunt_occupation"];
        self.pasword = [aDecoder decodeObjectForKey:@"pasword"];
        self.logInType = [aDecoder decodeIntegerForKey:@"logInType"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.aunt_id forKey:@"aunt_id"];
    [aCoder encodeObject:self.token forKey:@"token"];
    [aCoder encodeObject:self.aunt_name forKey:@"aunt_name"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.face_url forKey:@"face_url"];
    [aCoder encodeObject:self.birthday forKey:@"birthday"];
    [aCoder encodeObject:self.aunt_company forKey:@"aunt_company"];
    [aCoder encodeObject:self.aunt_occupation forKey:@"aunt_occupation"];
    [aCoder encodeObject:self.pasword forKey:@"pasword"];
    [aCoder encodeInteger:self.logInType forKey:@"logInType"];
    
}
@end


//@property (nonatomic,strong) NSString *aunt_id;
//@property (nonatomic,strong) NSString *token;
//@property (nonatomic,strong) NSString *aunt_name;
//@property (nonatomic,strong) NSString *email;
//@property (nonatomic,strong) NSString *face_url;
//@property (nonatomic,strong) NSString *birthday;
//@property (nonatomic,strong) NSString *aunt_company;
//@property (nonatomic,strong) NSString *aunt_occupation;

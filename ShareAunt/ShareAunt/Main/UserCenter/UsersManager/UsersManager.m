//
//  UsersManager.m
//  TJShop
//
//  Created by 周鑫 on 2018/8/8.
//  Copyright © 2018年 徐冬苏. All rights reserved.
//

#import "UsersManager.h"

#import "userModel.h"

@interface UsersManager ()

@end
@implementation UsersManager

+ (UsersManager *)sharedUsersManager {
    
    static UsersManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[super allocWithZone:nil] init];
    });
    
    return sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    return [UsersManager sharedUsersManager];
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return [UsersManager sharedUsersManager];
}


- (BOOL)loginWithUser:(userModel *)userModel {
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"User.sqlite"];
    return  [NSKeyedArchiver archiveRootObject:userModel toFile:filePath];
    
}

- (BOOL)logOut {
    
    self.currentUser = nil;
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"User.sqlite"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        NSError *error;
        self.login = NO;
        return [fileManager removeItemAtPath:filePath error:&error];
        
    }else {
        TJLog(@"用户文件不存在");
        self.login = NO;
        return YES;
    }
   
    
}

- (BOOL)save {
    
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"User.sqlite"];
    return  [NSKeyedArchiver archiveRootObject:self.currentUser toFile:filePath];
    

}


- (BOOL)isLogin {
    
    return self.currentUser?YES:NO;
}
#pragma mark -------------------------- lazy load ----------------------------------------
//- (NSArray<userModel *> *)users {
//
//    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
//    NSString *sqlFilePath = [docPath stringByAppendingPathComponent:@"Users.sqlite"];
//    NSArray *usersArr = [NSArray arrayWithContentsOfFile:sqlFilePath];
//
//    return usersArr;
//}

- (userModel *)currentUser {
    
    if (!_currentUser) {
        
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
        NSString *filePath = [docPath stringByAppendingPathComponent:@"User.sqlite"];
        _currentUser =  [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    }
    return _currentUser;
    
}

- (void)setJobArea:(NSDictionary *)area {
    
    if (!area) { return; }
    if (!self.currentUser.jobMode) {
        self.currentUser.jobMode = [NSDictionary dictionaryWithDictionary:area];
    } else {
        [self.currentUser.jobMode setValue:area[jobModeKeyArea] forKey:jobModeKeyArea];
        [self.currentUser.jobMode setValue:area[jobModeKeyDestination] forKey:jobModeKeyDestination];
        
    }
    
    [self save];
    
}

- (void)setJobBespeakTime:(NSDictionary *)bespeakTime {
    
    if (!bespeakTime) { return; }
    if (!self.currentUser.jobMode) {
        self.currentUser.jobMode = [NSDictionary dictionaryWithDictionary:bespeakTime];
    } else {
        [self.currentUser.jobMode setValue:bespeakTime[jobModeKeyStart] forKey:jobModeKeyStart];
        [self.currentUser.jobMode setValue:bespeakTime[jobModeKeyEnd] forKey:jobModeKeyEnd];
    }
    [self save];
}

- (void)setJobAreaAndBespeakTime:(NSDictionary *)jobMode  {
    
    if (!jobMode) { return; }
    if (!self.currentUser.jobMode) {
        self.currentUser.jobMode = [NSDictionary dictionaryWithDictionary:jobMode];
    } else {
        [self.currentUser.jobMode setValue:jobMode[jobModeKeyArea] forKey:jobModeKeyArea];
        [self.currentUser.jobMode setValue:jobMode[jobModeKeyDestination] forKey:jobModeKeyDestination];
        [self.currentUser.jobMode setValue:jobMode[jobModeKeyStart] forKey:jobModeKeyStart];
        [self.currentUser.jobMode setValue:jobMode[jobModeKeyEnd] forKey:jobModeKeyEnd];
    }
    [self save];
    
}

- (NSDictionary *)getJobMode {
    return self.currentUser.jobMode;
}




@end

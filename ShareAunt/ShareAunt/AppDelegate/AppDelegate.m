//
//  AppDelegate.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/10.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "AppDelegate.h"
#import "TJHomeViewController.h"
#import "TJNavigationController.h"
#import "TJLogInViewController.h"
#import "TJSigninViewController.h"
#import "TJMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
     [[TJNetworkReachabilityManager manager] startMonitoring];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.rootViewController = [[TJNavigationController alloc]initWithRootViewController:[[TJLogInViewController alloc]init]];
//    self.window.rootViewController = [[TJNavigationController alloc]initWithRootViewController:[[TJSigninViewController alloc]init]];
    TJMainViewController *MainVC = [[TJMainViewController alloc]init];
    MainVC.selectIndex = 1;
    MainVC.automaticallyCalculatesItemWidths = YES;
    self.window.rootViewController = [[TJNavigationController alloc]initWithRootViewController:[[TJMainViewController alloc]init]];
    [self.window makeKeyWindow];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - 加载页面
- (void)TJ_gotoHomePage {
    
    TJMainViewController *MainVC = [[TJMainViewController alloc]init];
    MainVC.selectIndex = 1;
    MainVC.automaticallyCalculatesItemWidths = YES;
    self.window.rootViewController = [[TJNavigationController alloc]initWithRootViewController:[[TJMainViewController alloc]init]];
    [self.window makeKeyWindow];
}

@end

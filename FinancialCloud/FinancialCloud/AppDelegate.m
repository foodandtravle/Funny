//
//  AppDelegate.m
//  FinancialCloud
//
//  Created by SSP_MACMINI-001 on 15/10/26.
//  Copyright © 2015年 SHR. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarViewController.h"
typedef enum : NSUInteger {
    App_Unkonw = 0,
    App_Launch_Auto,/**<自动登录,用户尚未登录*/
    App_Launch_Refresh,/**<用户已经登录*/
    App_WillEnterForward /**<从后台到前台,用户已经登录*/
} AppStatus;

@interface AppDelegate ()<UIAlertViewDelegate>
{
    UIActivityIndicatorView *theIndView;
    NSTimer *backgroundTimer;
    BOOL needRefreshSession;
    BOOL xmppLogin;/**<记录app退到后台之前XMPP的连接状态*/
    NSInteger seconds;
    BOOL isVersionTested;/**<App单次启动,是否进行了版本检测,登录状态和未登录状态*/
    UIImageView *backView;/**<当应用进入后台,把这个View显示出来,防止关键信息被截屏*/
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //判断有没有指纹或者AlertView的弹出框
    [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"alertOne"];
    
    //更改电池条状态
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];
    
    //初始化Window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [BaseTabBarViewController new];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

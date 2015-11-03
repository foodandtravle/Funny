//
//  AppDelegate.h
//  FinancialCloud
//
//  Created by SSP_MACMINI-001 on 15/10/26.
//  Copyright © 2015年 SHR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FinancialCloud.pch"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (nonatomic,retain)UIWindow *autoLogInInMaskInMaskWindow;
@property (nonatomic,retain)UIWindow *theMaskWindow;

/**显示警告框*/
- (void)showAlert:(NSString *)message;

@end


//
//  AccountManager.h
//  FinancialCloud
//
//  Created by SSP_MACMINI-001 on 15/10/26.
//  Copyright © 2015年 SHR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountManager : NSObject

@property (nonatomic,assign) BOOL isLogin;
@property (nonatomic,assign) BOOL isAutoLogin;
@property (nonatomic,copy)NSString *encStringForLocalVerify;
@property (nonatomic,copy)NSString * autoLoginToken;
@property (nonatomic,strong)NSMutableDictionary *accountInfo;
@property (nonatomic,copy)NSString *gesturePWStr;


#pragma mark - for Message
@property (nonatomic,assign)BOOL isBackgroundRunning;/**<是否后台运行*/
@property (nonatomic,assign)NSInteger msgCount;/**<消息条数*/
@property (nonatomic,copy)NSString *userLevelString;
@property (nonatomic,strong)NSNumber *bindedCardNumber;
@property (nonatomic,copy)NSString *availableEAccountBalance;
@property (nonatomic,strong)NSNumber *eMailVerifyFlag;
@property (nonatomic,strong)NSNumber *mobileVerifyFlag;


/**创建账户管理类单例对象*/
+ (instancetype)sharedManager;

+(NSMutableDictionary *)prepareAccountInfoDicWithDic:(NSDictionary *)dic;

/**清除用户数据*/
- (void)clearUserData;
/**存储账户信息*/
- (void)saveAccountInfo;
/**判断名字是否真实存在*/
- (void)isRealNameAuth;


/**用户手机号码*/
- (NSString *)userPhoneNum;
/**使用者ID类型*/
- (NSString *)userIDType;
/**使用者ID*/
- (NSString *)userIDNum;
/**使用者Email*/
- (NSString *)userEmail;
/**使用者真实名字*/
- (NSString *)userRealName;
/**使用者昵称*/
- (NSString *)userNickName;
/**使用者名字*/
- (NSString *)theUserName;
/**使用者*/
- (NSString *)userEntname;
/**使用者斜角*/
- (NSString *)userLevel;
/**卡片账户个数*/
- (NSString *)cardAcctountCount;

- (BOOL)transPWSetAllReady;
- (BOOL)idCardOrNot;
- (BOOL)isPersonalInfomationSet;
- (BOOL)isRealNameSet;
- (BOOL)isLoginPasswordSet;
- (BOOL)isTradePasswordSet;
- (BOOL)isEAccountSet;
- (BOOL)hasAnyBankCardBinded;
- (BOOL)isInternetBankSet;
- (BOOL)isUnionMember;

@end

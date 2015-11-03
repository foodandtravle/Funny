//
//  AccountManager.m
//  FinancialCloud
//
//  Created by SSP_MACMINI-001 on 15/10/26.
//  Copyright © 2015年 SHR. All rights reserved.
//

#import "AccountManager.h"

@implementation AccountManager

+(instancetype)sharedManager
{
    static AccountManager *manager = nil;
    @synchronized(self)
    {
        manager = [AccountManager new];
    }
    return manager;
}

@end

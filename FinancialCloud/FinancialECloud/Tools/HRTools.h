//
//  HRTools.h
//  FinancialCloud
//
//  Created by SSP_MACMINI-001 on 15/10/27.
//  Copyright © 2015年 SHR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HRTools : UIView

/**判断是否是iPhone5*/
+(BOOL)iphone5;

+(UILabel *)labelWithTitle:(NSString *)title fontSize:(float)fs constrainSize:(CGSize)s;

@end

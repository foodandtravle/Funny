//
//  HRTools.m
//  FinancialCloud
//
//  Created by SSP_MACMINI-001 on 15/10/27.
//  Copyright © 2015年 SHR. All rights reserved.
//

#import "HRTools.h"

@implementation HRTools

+(BOOL)iphone5
{
    CGSize s0 = [[UIScreen mainScreen] bounds].size;
    float scale0 = [[UIScreen mainScreen] scale];
    CGSize s1 = CGSizeMake(s0.width*scale0,s0.height*scale0);
    return  (s1.height > 960 + 20);
}

+(UILabel *)labelWithTitle:(NSString *)title fontSize:(float)fs constrainSize:(CGSize)s{
    
    CGSize constrainSize;
    if(CGSizeEqualToSize(s, CGSizeZero)){
        constrainSize = CGSizeMake(100, fs);
        
    }else{
        constrainSize = s;
    }
    
    CGSize newS = [title sizeWithFont:[UIFont systemFontOfSize:fs] constrainedToSize:constrainSize lineBreakMode:NSLineBreakByWordWrapping];
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, newS.width, newS.height)];
    l.font = [UIFont systemFontOfSize:fs];
    l.backgroundColor = [UIColor clearColor];
    l.textAlignment = NSTextAlignmentCenter;
    
    l.textColor = [UIColor blackColor];
    l.text = title;
    
    return l;
    
}


@end

//
//  HomeBaseViewController.h
//  FinancialCloud
//
//  Created by SSP_MACMINI-001 on 15/10/26.
//  Copyright © 2015年 SHR. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeBaseViewController : BaseViewController


@property (nonatomic,strong) NSMutableArray  *dataArray;//数据模型数组*/

@property (nonatomic,strong) UILabel *label0;/**企业融资*/

@property (nonatomic,strong) UILabel *label1;/**员工收益*/

@property (nonatomic,strong) UILabel *label11;/**显示当前在线人数*/

@property (nonatomic,strong) UILabel *label2;/**未读信息条数*/
/***/
@property (nonatomic,strong) UIImageView *readLabel;

@property (nonatomic,strong) UILabel *pL;/**有多少个产品*/

@property (nonatomic,strong) UILabel *shouyiL;/**显示收益是多少*/

@property (nonatomic,strong) UILabel *assetL;/**资产和可用资金*/
/***/
@property (nonatomic,strong) NSTimer *effectTimer;

@property (nonatomic,strong) NSTimer *timer;/**控制首页轮播动画的时间器*/
/***/
@property (nonatomic,assign) float startAmt;
/***/
@property (nonatomic,assign) float addAmt;
/***/
@property (nonatomic,assign) NSInteger times;


@property (nonatomic,strong) UIScrollView *scrollView;/**首页自动轮播的滚动视图*/
@property (nonatomic,strong) UIPageControl * pageControl;//创建翻页控制器

@property (nonatomic,assign) BOOL status;/**当前控机制器的状态*/
@end

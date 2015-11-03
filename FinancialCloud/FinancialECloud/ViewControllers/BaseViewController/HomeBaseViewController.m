//
//  HomeBaseViewController.m
//  FinancialCloud
//
//  Created by SSP_MACMINI-001 on 15/10/26.
//  Copyright © 2015年 SHR. All rights reserved.
//

#import "HomeBaseViewController.h"

@interface HomeBaseViewController ()<UIScrollViewDelegate>

@end

@implementation HomeBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化导航条
    [self customNavigationController];
    //创建UI
    [self createSubViews];
}

#pragma mark - 创建UI
- (void)createSubViews
{
    //创建首页自动轮播的ScrollView
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, maiScr.width, IPHONE5?126:136)];
    self.scrollView.contentSize = CGSizeMake(maiScr.width*5, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
    
    //创建翻页控制器
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.scrollView.frame.size.width-60, self.scrollView.frame.size.height-30, 60, 30)];
    self.pageControl.numberOfPages = 3;
    self.pageControl.pageIndicatorTintColor = [UIColor redColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    self.pageControl.currentPage = 0;
    self.pageControl.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.pageControl];
    
    NSArray *imgNameArr=@[@[@"background_homepage_my_invest",@"Home(1)(1)"],@[@"metro_001",@"Home(1)(1)"],@[@"banner_pt"],@[@"background_homepage_my_invest",@"Home(1)(1)"],@[@"metro_001",@"Home(1)(1)"]];
    
    //创建轮播图片
    for (NSInteger i=0; i<5; i++){
        
        UIImageView *iv = [self imageView:imgNameArr[i] imageViewframe:CGRectMake(maiScr.width*i, 0, maiScr.width, IPHONE5?126:136)];
        
        [self.scrollView addSubview:iv];
    }
    
    //初始化轮播时间器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(nextImageView) userInfo:nil repeats:YES];
}

//创建scrollView里的imgView
-(UIImageView *)imageView:(NSArray *)imgNameArr imageViewframe:(CGRect)frame{
    
    UIImageView *iv=[[UIImageView alloc]initWithFrame:frame];
    
    iv.image=[UIImage imageNamed:imgNameArr[0]];
    
    iv.userInteractionEnabled=YES;
    
    if (imgNameArr.count>1) {
        
        CGRect frame2=CGRectMake(20, 30, maiScr.width-40, 66);
        
        UIImageView *currentIv=[[UIImageView alloc]initWithFrame:frame2];
        
        currentIv.image=[UIImage imageNamed:imgNameArr[1]];
        
        [iv addSubview:currentIv];
        
    }
    return iv;
}

#pragma mark - 初始化导航条
- (void)customNavigationController{
    //设置导航条的背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationItem1"] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航条的标题图片
    UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_01"]];
    icon.frame = CGRectMake(0, 0, 120, 35);
    icon.backgroundColor = [UIColor clearColor];
    [self.navigationItem setTitleView:icon];
    
    //设置导航条右侧专用按钮(小闹钟)
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"info_01.png"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 204;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - 导航条右侧专用按钮(小闹钟)点击事件
- (void)rightBtnClick:(UIButton *)sender{
    
    NSLog(@"点击了导航栏右侧专用按钮...");
}

#pragma mark - 轮播动画时间器的事件
- (void)nextImageView
{
    int page = (int)self->_pageControl.currentPage;
    
    page++;
    
    if (page > 2){
        
        page = 0;
    }
    //滚动scrollview
    CGFloat x = page * self.scrollView.frame.size.width;
    
    if (x==0){
        self.scrollView.contentOffset = CGPointMake(x, 0);
        
    }else {
        [UIView animateWithDuration:1 animations:^{
            
            self.scrollView.contentOffset = CGPointMake(x, 0);
        }];
    }
    self.pageControl.currentPage=page;
}

#pragma mark - ScrollViewDelegate

// 开始拖拽的时候调用//定时轮播的时候不调用这个方法，只有手指触屏拖拽时才会调用到
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x == 0){
        //  此处不需要动画效果，因为要进行相同图片的替换
        scrollView.contentOffset = CGPointMake(maiScr.width*3, 0);
    }
    else if (scrollView.contentOffset.x == maiScr.width*4){
        scrollView.contentOffset = CGPointMake(maiScr.width, 0);
    }
    
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //    开启定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextImageView) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
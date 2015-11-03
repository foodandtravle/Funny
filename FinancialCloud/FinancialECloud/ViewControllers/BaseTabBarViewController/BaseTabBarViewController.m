//
//  BaseTabBarViewController.m
//  FinancialCloud
//
//  Created by SSP_MACMINI-001 on 15/10/26.
//  Copyright © 2015年 SHR. All rights reserved.
//

#import "BaseTabBarViewController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    [self createUI];
}

- (void)createUI
{
    //隐藏原有的tabBar
    self.tabBar.hidden = NO;
    
    //创建tabBar上面的自定义Item按钮
    NSArray *titleArray = @[@"服务",@"主页",@"个人中心"];
    NSArray *imageNameArray = @[@"toolbar_0_3",@"toolbar_1_0",@"toolbar_2_3"];
    NSArray *selectedImageNameArray = @[@"toolbar_0_2",@"toolbar_1_1",@"toolbar_2_2"];
    NSArray *ncArr=@[@"ServerViewController",@"HomeViewController",@"PersonalCenterViewController"];
    NSMutableArray *tabBarViewControllers = [NSMutableArray new];
    
    for (NSInteger i=0; i<3; i++){
        
        Class cl=NSClassFromString(ncArr[i]);
        
        UIViewController *vc=[[cl alloc] init];
        
        vc.navigationItem.title=titleArray[i];
        
        UINavigationController *nc=[[UINavigationController   alloc]initWithRootViewController:vc];
        
        UITabBarItem *item=[[UITabBarItem alloc] initWithTitle:titleArray[i]
                                                         image:[[UIImage imageNamed:imageNameArray[i]]
                                        imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                 selectedImage:[[UIImage imageNamed:selectedImageNameArray[i]]
                                        imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
       
        //上移4
        [item setTitlePositionAdjustment:UIOffsetMake(0, -4)];
        
        //字体  大小 颜色
        [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],
                            NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
        
        nc.tabBarItem=item;
        
        [tabBarViewControllers addObject:nc];
        
        
    }
    
    self.viewControllers =tabBarViewControllers;
    
    self.selectedIndex=1;// tabBar响应位置
    
    self.tabBar.backgroundImage=[UIImage imageNamed:@"navigationItem0"];
}







#pragma mark - 快速创建Button的方法
- (UIButton *)buttonWithTitleName:(NSString *)titleName imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:titleName forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    
    return btn;
}
#pragma mark - 快速创建tabBarItem的方法
- (UITabBarItem *)tabBarItemWithName:(NSString *)name imageName:(NSString *)imageName selectedImageName:(NSString *)selectedName
{
    //设置工具的item
    UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:name image:image selectedImage:selectedImage];
    //调整字体的大小和位置
    [item setTitlePositionAdjustment:UIOffsetMake(0, -4)];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSFontAttributeName:RGB(241, 241, 241 )} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:RGB(83, 187, 240)} forState:UIControlStateSelected];
    
    return item;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

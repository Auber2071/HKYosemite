//
//  HKYTabBarController.m
//  HKYosemite
//
//  Created by hankai on 2017/6/24.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYTabBarController.h"
#import "HKYTabBar.h"
#import "HKYNavigationController.h"

#import "HKYEssenceViewController.h"
#import "HKYNewViewController.h"
#import "HKYFriendTrendsViewController.h"
#import "HKYMeViewController.h"

@interface HKYTabBarController ()

@end

@implementation HKYTabBarController

//当第一次使用这个类的时候调用一次
+(void)initialize{
    NSMutableDictionary *attributeDic = [NSMutableDictionary dictionary];
    attributeDic[NSForegroundColorAttributeName] = [UIColor grayColor];
    attributeDic[NSFontAttributeName] = [UIFont systemFontOfSize:12.f];
    
    
    NSMutableDictionary *selectedAttributeDic = [NSMutableDictionary dictionary];
    attributeDic[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    attributeDic[NSFontAttributeName] =  attributeDic[NSFontAttributeName];
    
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attributeDic forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttributeDic forState:UIControlStateSelected];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_setupChildVC:[[HKYEssenceViewController alloc] init] title:@"精华" defaultImgName:@"tabBar_essence_icon" selectedImgName:@"tabBar_essence_click_icon"];
    [self p_setupChildVC:[[HKYNewViewController alloc] init] title:@"新帖" defaultImgName:@"tabBar_new_icon" selectedImgName:@"tabBar_new_click_icon"];
    [self p_setupChildVC:[[HKYFriendTrendsViewController alloc] init] title:@"关注" defaultImgName:@"tabBar_friendTrends_icon" selectedImgName:@"tabBar_friendTrends_click_icon"];
    [self p_setupChildVC:[[HKYMeViewController alloc] init] title:@"我" defaultImgName:@"tabBar_me_icon" selectedImgName:@"tabBar_me_click_icon"];
    
    [self setValue:[[HKYTabBar alloc] init] forKeyPath:@"tabBar"];

}

-(void)p_setupChildVC:(UIViewController *)childVC title:(NSString *)title defaultImgName:(NSString *)defaultImgName selectedImgName:(NSString *)selectedImgName{
    
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:defaultImgName];
    childVC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImgName];
    
    HKYNavigationController *navi = [[HKYNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:navi];
    
}

@end

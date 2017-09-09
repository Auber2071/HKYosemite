//
//  HKYMeViewController.m
//  HKYosemite
//
//  Created by hankai on 2017/6/24.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYMeViewController.h"

@interface HKYMeViewController ()

@end

@implementation HKYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HKSLog(@"%s",__func__);
}



-(void)setupNaviBarButtonItemAndTitle{
    self.navigationItem.title = @"我的";
    
    UIBarButtonItem *settingBarBtnItem = [UIBarButtonItem itemWithDefaultImgName:@"mine-setting-icon" highLightImgName:@"mine-setting-icon-click" target:self action:@selector(p_settingClick)];
    UIBarButtonItem *moonBarBtnItem = [UIBarButtonItem itemWithDefaultImgName:@"mine-moon-icon" highLightImgName:@"mine-moon-icon-click" target:self action:@selector(p_moonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingBarBtnItem,moonBarBtnItem];
}


-(void)p_settingClick{
    HKSLog(@"%s",__func__);
}

-(void)p_moonClick{
    HKSLog(@"%s",__func__);
}

@end

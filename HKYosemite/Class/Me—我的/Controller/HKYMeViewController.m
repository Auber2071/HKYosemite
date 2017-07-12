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

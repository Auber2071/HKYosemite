//
//  HKYNewViewController.m
//  HKYosemite
//
//  Created by hankai on 2017/6/24.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYNewViewController.h"

@interface HKYNewViewController ()

@end

@implementation HKYNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HKSLog(@"%s",__func__);
}


-(void)setupNaviBarButtonItemAndTitle{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithDefaultImgName:@"MainTagSubIcon" highLightImgName:@"MainTagSubIconClick" target:self action:@selector(p_clickNew)];
}


-(void)p_clickNew{
    HKSLog(@"%s",__func__);
}






@end

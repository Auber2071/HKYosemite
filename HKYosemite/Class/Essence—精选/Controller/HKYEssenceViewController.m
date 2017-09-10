//
//  HKYEssenceViewController.m
//  HKYosemite
//
//  Created by hankai on 2017/6/24.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYEssenceViewController.h"
#import "HKYRecommendTagsViewController.h"

@interface HKYEssenceViewController ()

@end

@implementation HKYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HKSLog(@"%s",__func__);
}

-(void)setupNaviBarButtonItemAndTitle{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithDefaultImgName:@"MainTagSubIcon" highLightImgName:@"MainTagSubIconClick" target:self action:@selector(p_clickEssence)];
}


-(void)p_clickEssence{
    HKSLog(@"%s",__func__);
    
    HKYRecommendTagsViewController *recommendTagsVC = [[HKYRecommendTagsViewController alloc] init];
    [self.navigationController pushViewController:recommendTagsVC animated:YES];
}




@end

//
//  HKYFriendTrendsViewController.m
//  HKYosemite
//
//  Created by hankai on 2017/6/24.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYFriendTrendsViewController.h"
#import "HKYRecommendViewController.h"


@interface HKYFriendTrendsViewController ()

@end

@implementation HKYFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HKSLog(@"%s",__func__);
}



-(void)setupNaviBarButtonItemAndTitle{
    self.navigationItem.title = @"我的关注";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithDefaultImgName:@"friendsRecommentIcon" highLightImgName:@"friendsRecommentIcon-click" target:self action:@selector(p_clickFriendTrends)];
}


-(void)p_clickFriendTrends{
    HKSLog(@"%s",__func__);
    
    HKYRecommendViewController *recommendVC = [[HKYRecommendViewController alloc] initWithNibName:@"HKYRecommendViewController" bundle:nil];
    [self.navigationController pushViewController:recommendVC animated:YES];
    
}



@end

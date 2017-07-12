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

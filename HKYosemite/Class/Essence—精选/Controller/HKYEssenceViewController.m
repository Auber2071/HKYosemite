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
@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, strong) UIButton *selectedBtn;
@property (nonatomic, strong) UIView *titlesView;

@end

@implementation HKYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HKSLog(@"%s",__func__);
    
    [self p_setupContentView];
    [self p_setupTitlesView];

}

-(void)setupNaviBarButtonItemAndTitle{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithDefaultImgName:@"MainTagSubIcon" highLightImgName:@"MainTagSubIconClick" target:self action:@selector(p_clickEssence)];
}


-(void)p_setupContentView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *contentView = [[UIScrollView alloc] init];
    [contentView setFrame:self.view.bounds];
    CGFloat bottom = self.tabBarController.tabBar.height;
    
    contentView.contentInset = UIEdgeInsetsMake(99, 0, bottom, 0);
    
    [self.view addSubview:contentView];
}


-(void)p_setupTitlesView{
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
    //titlesView.backgroundColor = [[UIColor whiteColor]  colorWithAlphaComponent:0.5];
    //titlesView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    titlesView.width = self.view.width;
    titlesView.height = 35;
    titlesView.y = 64;
    titlesView.x = 0;
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    self.indicatorView = [[UIView alloc] init];
    self.indicatorView.backgroundColor = [UIColor redColor];
    self.indicatorView.height = 2;
    self.indicatorView.y = titlesView.height - self.indicatorView.height;
    [titlesView addSubview:self.indicatorView];

    
    NSArray *titlesArr = @[@"全部",@"视频",@"音频",@"图片",@"段子"];
    CGFloat width = titlesView.width/titlesArr.count;
    CGFloat height = titlesView.height;
    for (int i = 0; i<titlesArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titlesArr[i] forState:UIControlStateNormal];
        //[button layoutIfNeeded];//强制更新子控件frame
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
        button.height = height;
        button.width = width;
        button.x = i*width;
        button.y = 0;
        [button addTarget:self action:@selector(p_titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:button];
        
        if (i == 0) {
            button.enabled = NO;
            self.selectedBtn = button;
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width;
            self.indicatorView.centerX = button.centerX;
        }
    }
}

-(void)p_titleClick:(UIButton *)sender{
    self.selectedBtn.enabled = YES;
    sender.enabled = NO;
    self.selectedBtn = sender;
    
    [UIView animateWithDuration:0.25f animations:^{
        self.indicatorView.width = sender.titleLabel.width;
        self.indicatorView.centerX = sender.centerX;
    }];
}


-(void)p_clickEssence{
    HKSLog(@"%s",__func__);
    
    HKYRecommendTagsViewController *recommendTagsVC = [[HKYRecommendTagsViewController alloc] init];
    [self.navigationController pushViewController:recommendTagsVC animated:YES];
}




@end

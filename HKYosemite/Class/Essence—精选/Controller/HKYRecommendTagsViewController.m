//
//  HKYRecommendTagsViewController.m
//  HKYosemite
//
//  Created by hankai on 2017/9/10.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYRecommendTagsViewController.h"

#import "HKYRecommendTagModel.h"
#import "HKYRecommendTagCell.h"

#import <SVProgressHUD/SVProgressHUD.h>
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>

@interface HKYRecommendTagsViewController ()
@property (nonatomic, strong) NSArray *tags;

@end

static NSString *HKYTagId = @"tag";

@implementation HKYRecommendTagsViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self p_setupTableView];
    [self p_requestRecommendTagsData];

}

-(void)p_setupTableView{
    self.title = @"推荐标签";
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HKYRecommendTagCell class]) bundle:nil] forCellReuseIdentifier:HKYTagId];
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = HKYRGBColor(223, 223, 223);
    self.tableView.showsVerticalScrollIndicator = NO;
}

-(void)p_requestRecommendTagsData{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"c"] = @"topic";
    params[@"action"] = @"sub";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //隐藏指示器
        [SVProgressHUD dismiss];
        //服务器返回的JSON数据
        HKSLog(@"%@",responseObject);
        
        self.tags = [HKYRecommendTagModel mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载关注信息失败"];
    }];

}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HKYRecommendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:HKYTagId];
    cell.recommendTag = self.tags[indexPath.row];
    return cell;
}

@end

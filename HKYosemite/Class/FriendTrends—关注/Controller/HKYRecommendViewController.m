//
//  HKYRecommendViewController.m
//  HKYosemite
//
//  Created by hankai on 2017/6/25.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYRecommendViewController.h"

#import "HKYRecommendCategoryModel.h"
#import "HKYRecommendCategoryCell.h"

#import "HKYRecommendUserCell.h"
#import "HKYRecommendUserModel.h"



#import <SVProgressHUD/SVProgressHUD.h>
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import <MJRefresh/MJRefresh.h>

#define HKYSelectedCategoryCell self.categoriesArr[self.categoryTableView.indexPathForSelectedRow.row]

@interface HKYRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (nonatomic, strong) NSArray *categoriesArr;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableDictionary *paramsMutDict;
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation HKYRecommendViewController

static NSString *const HKYCategoryId = @"category";
static NSString *const HKYUserId = @"user";


- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setTableView];
    [self p_setupRefresh];
    [self p_requestCategoryData];
    
}

-(void)p_setupRefresh{
    self.userTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(p_loadNewUsers)];
    
    //back 需要向上拉动才会加载更多
    //auto
    self.userTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(p_loadMoreData)];
}

-(void)p_setTableView{
    self.navigationItem.title = @"推荐关注";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = self.categoryTableView.contentInset;
    self.userTableView.rowHeight = 70;
    
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([HKYRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:HKYCategoryId];
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([HKYRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:HKYUserId];
}

#pragma mark - UITabelViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.categoryTableView) {
        return self.categoriesArr.count;
    }else{
        [self p_checkFooterState];
        return [HKYSelectedCategoryCell usersMutArr].count;
    }
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.categoryTableView) {
        HKYRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:HKYCategoryId];
        cell.categoryModel = self.categoriesArr[indexPath.row];
        return cell;
    }else{
        HKYRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:HKYUserId];
        cell.user = [HKYSelectedCategoryCell usersMutArr][indexPath.row];
        return cell;
    }
}

#pragma mark - UITabelViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //结束刷新
    [self.userTableView.mj_header endRefreshing];
    [self.userTableView.mj_footer endRefreshing];
    
    
    HKYRecommendCategoryModel *categoryCell = self.categoriesArr[indexPath.row];
    HKSLog(@"category name:%@",categoryCell.name);
    
    [self.userTableView.mj_footer endRefreshing];
    
    if (categoryCell.usersMutArr.count) {
        [self.userTableView reloadData];
    }else{
        //防止显示上一分类的数据
        [self.userTableView reloadData];
        
        //进入刷新状态
        [self.userTableView.mj_header beginRefreshing];
    }
}

#pragma mark - 上拉及下来刷新向服务器请求数据

-(void)p_loadNewUsers{
    HKSLog(@"%s",__func__);
    
    HKYRecommendCategoryModel *categoryCell = HKYSelectedCategoryCell;
    
    //设置当前页码为1
    categoryCell.currentPage = 1;
    
    //显示指示器
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(categoryCell.id);
    params[@"page"] = @(categoryCell.currentPage);
    self.paramsMutDict = params;
    
    //发送请求给服务器，加载右侧的数据
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //字典数组 —> 模型数据
        NSArray *users = [HKYRecommendUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //请求所有旧数据
        [categoryCell.usersMutArr removeAllObjects];
        //添加到当前类别对应的用户数组中
        [categoryCell.usersMutArr addObjectsFromArray:users];
        //保存总数
        categoryCell.total = [responseObject[@"total"] integerValue];

        
        if (self.paramsMutDict != params) {
            return;
        }
        
        //隐藏指示器
        [SVProgressHUD dismiss];
        //服务器返回的JSON数据
        HKSLog(@"右侧数据:%@",responseObject[@"list"]);
        
        
        //刷新右侧列表
        [self.userTableView reloadData];
        
        [self.userTableView.mj_header endRefreshing];

        //让底部控件结束刷新
        [self p_checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.paramsMutDict != params) {
            return;
        }

        //显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        [self.userTableView.mj_header endRefreshing];
    }];
    
}


-(void)p_loadMoreData{
    HKSLog(@"%s",__func__);
    
    HKYRecommendCategoryModel *categoryCell = HKYSelectedCategoryCell;
    //显示指示器
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(categoryCell.id);
    params[@"page"] = @(++categoryCell.currentPage);
    self.paramsMutDict = params;
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //字典数组 —> 模型数据
        NSArray *users = [HKYRecommendUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //添加到当前类别对应的用户数组中
        [categoryCell.usersMutArr addObjectsFromArray:users];
        
        if (self.paramsMutDict != params) {
            return;
        }
        
        //隐藏指示器
        [SVProgressHUD dismiss];
        //服务器返回的JSON数据
        HKSLog(@"右侧数据:%@",responseObject[@"list"]);

        [self.userTableView reloadData];
        
        
        //让底部控件结束刷新
        [self p_checkFooterState];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.paramsMutDict != params) {
            return;
        }
        //显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        [self.userTableView.mj_footer endRefreshing];
        
    }];
}

-(void)p_checkFooterState{
    HKYRecommendCategoryModel *categoryCell = HKYSelectedCategoryCell;
    //让底部控件结束刷新
    if (categoryCell.total == categoryCell.usersMutArr.count) {//全部数据已经加载完毕
        [self.userTableView.mj_footer endRefreshingWithNoMoreData];
    }else{//还没有加载完毕全部数据
        [self.userTableView.mj_footer endRefreshing];
    }
    
    self.userTableView.mj_footer.hidden = ([categoryCell usersMutArr].count == 0);
}


#pragma mark - 向服务请请求分类数据

-(void)p_requestCategoryData{
    
    //显示指示器
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //隐藏指示器
        [SVProgressHUD dismiss];
        //服务器返回的JSON数据
        HKSLog(@"%@",responseObject[@"list"]);
        
        
        self.categoriesArr = [HKYRecommendCategoryModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.categoryTableView reloadData];
        //默认选中首行
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        //让用户列表进入下俩刷新状态
        [self.userTableView.mj_header beginRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败"];
    }];
}

-(AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}
#pragma mark - 控制器的销毁
-(void)dealloc{
    //停止所有的操作
    [self.manager.operationQueue cancelAllOperations];
}

@end

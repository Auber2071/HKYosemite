//
//  HKYRecommendCategoryModel.h
//  HKYosemite
//
//  Created by hankai on 2017/9/9.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HKYRecommendCategoryModel : NSObject
/** id */
@property (nonatomic, assign) NSInteger id;
/** 总数 */
@property (nonatomic, assign) NSInteger count;
/** 名字 */
@property (nonatomic, strong) NSString *name;

/** 这个类别对应的用户数据*/
@property (nonatomic, strong) NSMutableArray *usersMutArr;

/** 当前页码*/
@property (nonatomic, assign) NSInteger currentPage;

/** 总数*/
@property (nonatomic, assign) NSInteger total;
@end

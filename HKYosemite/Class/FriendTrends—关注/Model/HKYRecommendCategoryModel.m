//
//  HKYRecommendCategoryModel.m
//  HKYosemite
//
//  Created by hankai on 2017/9/9.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYRecommendCategoryModel.h"

@implementation HKYRecommendCategoryModel
-(NSMutableArray *)usersMutArr{
    if (!_usersMutArr) {
        _usersMutArr = [NSMutableArray array];
    }
    return _usersMutArr;
}
@end

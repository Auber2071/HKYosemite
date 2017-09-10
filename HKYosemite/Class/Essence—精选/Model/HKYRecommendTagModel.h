//
//  HKYRecommendTagModel.h
//  HKYosemite
//
//  Created by hankai on 2017/9/10.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HKYRecommendTagModel : NSObject
/** 图片 */
@property (nonatomic, copy) NSString *image_list;
/** 名字 */
@property (nonatomic, copy) NSString *theme_name;
/** 订阅数 */
@property (nonatomic, assign) NSInteger sub_number;



@end

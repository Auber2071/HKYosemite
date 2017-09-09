//
//  HKYRecommendUserModel.h
//  HKYosemite
//
//  Created by hankai on 2017/9/9.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HKYRecommendUserModel : NSObject
/** 头像*/
@property (nonatomic, copy) NSString *header;
/** 粉丝数(有多少人关注这个用户)*/
@property (nonatomic, assign) NSInteger fans_count;
/** 昵称 */
@property (nonatomic, copy) NSString *screen_name;



@end

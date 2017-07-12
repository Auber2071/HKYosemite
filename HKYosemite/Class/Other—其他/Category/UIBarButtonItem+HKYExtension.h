//
//  UIBarButtonItem+HKYExtension.h
//  HKYosemite
//
//  Created by hankai on 2017/6/25.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HKYExtension)

+(UIBarButtonItem *)itemWithDefaultImgName:(NSString *)defaultImgName highLightImgName:(NSString *)highLightImgName target:(id)target action:(SEL)action;

@end

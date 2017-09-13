//
//  UIBarButtonItem+HKYExtension.m
//  HKYosemite
//
//  Created by hankai on 2017/6/25.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "UIBarButtonItem+HKYExtension.h"

@implementation UIBarButtonItem (HKYExtension)

+(UIBarButtonItem *)itemWithDefaultImgName:(NSString *)defaultImgName highLightImgName:(NSString *)highLightImgName target:(id)target action:(SEL)action{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:defaultImgName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highLightImgName] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return [[self alloc] initWithCustomView:button];
}

@end

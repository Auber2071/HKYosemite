//
//  HKYTabBar.m
//  HKYosemite
//
//  Created by hankai on 2017/6/24.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYTabBar.h"

@interface HKYTabBar ()
@property (nonatomic, strong) UIButton *publishBtn;

@end

@implementation HKYTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        /**
         1，setBackgroundImage，图片会随着按钮的大小而改变，图片自动会拉伸来适应按钮的大小，这个时候任然可以设置按钮的title，图片不会挡住title；
         2，setImage，此时再设置title，title将无法显示。图片不会随着按钮的大小改变而改变。
         */
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_selected_icon"] forState:UIControlStateHighlighted];
        [self addSubview:button];
        
        self.publishBtn = button;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];

    [self.publishBtn setBounds:CGRectMake(0, 0, self.publishBtn.currentBackgroundImage.size.width, self.publishBtn.currentBackgroundImage.size.height)];
    [self.publishBtn setCenter:CGPointMake(CGRectGetWidth(self.frame)/2.f, CGRectGetHeight(self.frame)/2.f)];
    
    CGFloat buttonW = CGRectGetWidth(self.frame)/5.f;
    CGFloat buttonH = CGRectGetHeight(self.frame);
    CGFloat buttonY = 0.f;
    
    int index = 0;
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:[UIControl class]] || button == self.publishBtn) {
            continue;
        }else{
            CGFloat buttonX = buttonW * (index>1?(index + 1) : index);
            [button setFrame:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
            
            index++;
        }
    }
}

@end

//
//  HKYTextField.m
//  HKYosemite
//
//  Created by hankai on 2017/9/10.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYTextField.h"
#import <objc/runtime.h>

static NSString *const HKYPlaceholderColorKeyPath = @"_placeholderLabel.textColor";


@implementation HKYTextField


+(void)initialize{
    unsigned int count = 0;
    //拷贝出所有成员变量列表
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    for (int i = 0; i<count; i++) {
        //取出成员变量
        //Ivar ivar = *(ivars + i);
        Ivar ivar = ivars[i];
        
        HKSLog(@"成员变量：%s",ivar_getName(ivar));
    }
    //释放
    free(ivars);
    
    //拷贝出所有属性变量列表
    objc_property_t *propertyS = class_copyPropertyList([UITextField class], &count);
    for (int i = 0; i<count; i++) {
        objc_property_t property = propertyS[i];
        HKSLog(@"property：%s<------->属性类型：%s",property_getName(property),property_getAttributes(property));
    }
    free(propertyS);
    
    //拷贝出方法列表
    Method *methods = class_copyMethodList([UITextField class], &count);
    for (int i = 0; i<count; i++) {
        Method method = methods[i];
        //HKSLog(@"method:%@",method_getName(method));
    }
}


-(void)awakeFromNib{
    [super awakeFromNib];
    
    //修改占位文字颜色
    //[self setValue:[UIColor grayColor] forKeyPath:HKYPlaceholderColorKeyPath];
    [self resignFirstResponder];
    
    //设置光标颜色与文字颜色一致
    self.tintColor = self.textColor;
}

-(BOOL)becomeFirstResponder{
    [self setValue:self.textColor forKeyPath:HKYPlaceholderColorKeyPath];
    return [super becomeFirstResponder];
}


-(BOOL)resignFirstResponder{
    [self setValue:[UIColor grayColor] forKeyPath:HKYPlaceholderColorKeyPath];
    return [super resignFirstResponder];
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    
    //修改占位文字颜色
    [self setValue:placeholderColor forKeyPath:HKYPlaceholderColorKeyPath];
}

//-(void)drawPlaceholderInRect:(CGRect)rect{
//    [self.placeholder drawInRect:CGRectMake(0, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>) withAttributes:@{
//                                                       NSForegroundColorAttributeName : [UIColor grayColor],
//                                                       NSFontAttributeName : self.font
//                                                       }];
//}
@end

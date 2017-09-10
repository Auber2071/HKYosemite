//
//  HKYLoginRegisterViewController.m
//  HKYosemite
//
//  Created by hankai on 2017/9/10.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYLoginRegisterViewController.h"

@interface HKYLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UITextField *pwdField;
/** 登陆框距离控制器View左边的间距*/
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewLeftMargin;
@end

@implementation HKYLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    //NSAttributedString:带有属性的文字(富文本技术)
    NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:@"手机号" attributes:attrs];
    self.phoneField.attributedPlaceholder = placeholder;
    
    
}
- (IBAction)showLoginOrRegister:(UIButton *)sender {
    [self.view endEditing:YES];
    if (self.loginViewLeftMargin.constant == 0) {//显示注册
        [UIView animateWithDuration:0.2 animations:^{
            self.loginViewLeftMargin.constant = - self.view.width;
        }];
        sender.selected = YES;
    }else{//显示登陆
        [UIView animateWithDuration:0.2 animations:^{
            self.loginViewLeftMargin.constant = 0;
        }];
        sender.selected = NO;
    }
}


- (IBAction)setupDismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 当前控制器对应的状态栏的颜色
 */
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end

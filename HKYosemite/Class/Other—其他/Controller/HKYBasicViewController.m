//
//  HKYBasicViewController.m
//  HKYosemite
//
//  Created by hankai on 2017/6/25.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYBasicViewController.h"

@interface HKYBasicViewController ()

@end

@implementation HKYBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //0~254 :arc4random() % 255 或 arc4random_uniform(255)
    //[self.view setBackgroundColor:HKYRGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))];
    [self.view setBackgroundColor:HKYRGBColor(223, 223, 223)];
    [self setupNaviBarButtonItemAndTitle];
}


-(void)setupNaviBarButtonItemAndTitle{
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

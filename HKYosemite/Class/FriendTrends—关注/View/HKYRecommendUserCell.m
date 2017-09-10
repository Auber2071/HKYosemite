//
//  HKYRecommendUserCell.m
//  HKYosemite
//
//  Created by hankai on 2017/9/9.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYRecommendUserCell.h"
#import "HKYRecommendUserModel.h"

#import <UIImageView+WebCache.h>

@interface HKYRecommendUserCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end

@implementation HKYRecommendUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setUser:(HKYRecommendUserModel *)user{
    _user = user;
    self.screenNameLabel.text = user.screen_name;
    NSString *subNumber = nil;
    if (user.fans_count < 10000) {
        subNumber = [NSString stringWithFormat:@"%zd人关注",user.fans_count];
    }else{
        subNumber = [NSString stringWithFormat:@"%zd万人关注",(user.fans_count/10000)];
    }
    self.fansCountLabel.text = subNumber;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
}
@end

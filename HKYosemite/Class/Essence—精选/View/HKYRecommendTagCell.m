//
//  HKYRecommendTagCell.m
//  HKYosemite
//
//  Created by hankai on 2017/9/10.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYRecommendTagCell.h"
#import "HKYRecommendTagModel.h"
#import <UIImageView+WebCache.h>

@interface HKYRecommendTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageListImageView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;

@end

@implementation HKYRecommendTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(void)setFrame:(CGRect)frame{
    frame.origin.x = 5;
    frame.size.width -=  2*frame.origin.x;
    frame.size.height -= 1;
    [super setFrame:frame];
    
}

-(void)setRecommendTag:(HKYRecommendTagModel *)recommendTag{
    _recommendTag = recommendTag;
    
    [self.imageListImageView sd_setImageWithURL:[NSURL URLWithString:recommendTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themeNameLabel.text = recommendTag.theme_name;
    
    NSString *subNumber = nil;
    if (recommendTag.sub_number < 10000) {
        subNumber = [NSString stringWithFormat:@"%zd人订阅",recommendTag.sub_number];
    }else{
        subNumber = [NSString stringWithFormat:@"%zd万人订阅",(recommendTag.sub_number/10000)];
    }
    self.subNumberLabel.text = subNumber;
    
    
}

@end

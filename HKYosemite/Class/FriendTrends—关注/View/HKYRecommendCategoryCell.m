//
//  HKYRecommendCategoryCell.m
//  HKYosemite
//
//  Created by hankai on 2017/9/9.
//  Copyright © 2017年 Vencent. All rights reserved.
//

#import "HKYRecommendCategoryCell.h"
#import "HKYRecommendCategoryModel.h"

@interface HKYRecommendCategoryCell ()

/** 选中时显示的指示器控件*/
@property (weak, nonatomic) IBOutlet UIView *selectedIndictor;

@end

@implementation HKYRecommendCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = HKYRGBColor(244, 244, 244);
    self.selectedIndictor.backgroundColor = HKYRGBColor(219, 21, 26);
    
    //当cell的selection为none时，cel被选中时，内部的子控件将不会进入高亮状态
    //self.textLabel.highlightedTextColor = HKYRGBColor(219, 21, 26);

}

//初始化加载时，所有的cell都会预加载一次
//可以在此方法中监听cell的选中和取消选中
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectedIndictor.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedIndictor.backgroundColor : HKYRGBColor(78, 78, 78);

}

-(void)setCategoryModel:(HKYRecommendCategoryModel *)categoryModel{
    _categoryModel = categoryModel;
    self.textLabel.text = categoryModel.name;

}


-(void)layoutSubviews{
    [super layoutSubviews];
    //重新调整cell内部textLabel的frame
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height -2 * self.textLabel.y;
}



@end

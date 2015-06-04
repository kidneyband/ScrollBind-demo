//
//  TopCellView.m
//  CKQ
//
//  Created by user on 15-6-3.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "TopCellView.h"
#import "UIFont+WYDemo.h"
#import "UIView+WYDemo.h"

@interface TopCellView()

@property(nonatomic, strong) UILabel *categoryLabel;

@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UILabel *viewCountLabel;

@end

@implementation TopCellView

-(UILabel *)categoryLabel{
    if (!_categoryLabel) {
        _categoryLabel = [[UILabel alloc] init];
        _categoryLabel.font = [UIFont contentFont];
        _categoryLabel.backgroundColor = [UIColor blueColor];
    }
    return _categoryLabel;
}


-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont contentFont];
    }
    return _titleLabel;
}

-(UILabel *)viewCountLabel{
    if (!_viewCountLabel) {
        _viewCountLabel = [[UILabel alloc] init];
        _viewCountLabel.font = [UIFont contentFont];
        _viewCountLabel.textAlignment = NSTextAlignmentRight;
    }
    return _viewCountLabel;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.categoryLabel.text = @"产品";
        self.titleLabel.text = @"红红火火恍恍惚惚何厚铧";
        self.viewCountLabel.text = @"250浏览数";
        [self addSubview:self.categoryLabel];
        [self addSubview:self.titleLabel];
        [self addSubview:self.viewCountLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.categoryLabel.frame = CGRectMake(Padding, HalfPadding, 40, 30);
    self.viewCountLabel.frame = CGRectMake(self.width - 100 - HalfPadding, HalfPadding, 100, 30);
    self.titleLabel.frame = CGRectMake(self.categoryLabel.right + HalfPadding, HalfPadding, self.viewCountLabel.left - self.categoryLabel.right - 2 * HalfPadding, 30);
}












@end

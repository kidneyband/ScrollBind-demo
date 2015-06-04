//
//  BottomCellView.m
//  CKQ
//
//  Created by user on 15-6-3.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "BottomCellView.h"
#import "UIView+WYDemo.h"
#import "UIFont+WYDemo.h"
#define Padding 10
#define HalfPadding 5

@interface BottomCellView()

@property(nonatomic, strong) UIImageView *logoImage;

@property(nonatomic, strong) UILabel *companyNameLabel;

@property(nonatomic, strong) UILabel *dateLabel;

@property(nonatomic, strong) UILabel *briefLabel;

@end

@implementation BottomCellView

-(UIImageView *)logoImage{
    if (!_logoImage) {
        _logoImage = [[UIImageView alloc] init];
    }
    return _logoImage;
}

-(UILabel *)companyNameLabel{
    if (!_companyNameLabel) {
        _companyNameLabel = [[UILabel alloc] init];
        _companyNameLabel.font = [UIFont contentFont];
    }
    return _companyNameLabel;
}

-(UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.font = [UIFont contentFont];
    }
    return _dateLabel;
}

-(UILabel *)briefLabel{
    if (!_briefLabel) {
        _briefLabel = [[UILabel alloc] init];
        _briefLabel.font = [UIFont contentFont];
    }
    return _briefLabel;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.companyNameLabel.text = @"源升科技";
        self.dateLabel.text = @"1970-01-01";
        self.briefLabel.text = @"这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介";
        [self addSubview:self.logoImage];
        [self addSubview:self.companyNameLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.briefLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.logoImage.frame = CGRectMake(Padding, HalfPadding, 30, 30);
    self.dateLabel.frame = CGRectMake(self.width - 60 - Padding, HalfPadding, 60, 30);
    self.companyNameLabel.frame = CGRectMake(self.logoImage.right + HalfPadding, HalfPadding, self.dateLabel.left - self.logoImage.right - 2 * HalfPadding, 30);
    self.briefLabel.frame = CGRectMake(Padding, self.companyNameLabel.bottom + HalfPadding, self.width - 2 * Padding, 30);
}


@end

//
//  HomeCell.m
//  CKQ
//
//  Created by user on 15-6-3.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "HomeCell.h"
#import "TopCellView.h"
#import "BottomCellView.h"
#import "UIView+WYDemo.h"
#import "UIFont+WYDemo.h"

@interface HomeCell()

@property(nonatomic, strong) TopCellView *topView;

@property(nonatomic, strong) UIImageView *middleImage;

@property(nonatomic, strong) BottomCellView *bottomView;

@end


@implementation HomeCell

-(TopCellView *)topView{
    if (!_topView) {
        _topView = [[TopCellView alloc] init];
    }
    return _topView;
}

-(UIImageView *)middleImage{
    if (!_middleImage) {
        _middleImage = [[UIImageView alloc] init];
    }
    return _middleImage;
}

-(BottomCellView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[BottomCellView alloc] init];
    }
    return _bottomView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.topView];
        [self.contentView addSubview:self.middleImage];
        [self.contentView addSubview:self.bottomView];
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.topView.frame = CGRectMake(0, 0, self.width, 40);
    self.middleImage.frame = CGRectMake(0, self.topView.bottom, self.width, 100);
    self.bottomView.frame = CGRectMake(0, self.middleImage.bottom, self.width, 70);

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end

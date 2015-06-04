//
//  ToolScrollView.h
//  CKQ
//
//  Created by user on 15-6-2.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#define minimumNum 3
#define toolScrollViewH 30
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ToolScrollView : UIScrollView

-(instancetype)initWithFrame:(CGRect)frame configArray:(NSArray *)configArray;

-(void)btnOnClickWithTag:(NSInteger)btnTag;
-(void)changeIndicatorFrame:(CGFloat)shouldOffsetX;

@property(nonatomic, copy) void(^option)(NSInteger index);

@property(nonatomic, strong) NSArray *configArray;

@end

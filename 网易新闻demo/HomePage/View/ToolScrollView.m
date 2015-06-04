//
//  ToolScrollView.m
//  CKQ
//
//  Created by user on 15-6-2.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "ToolScrollView.h"
#import "ToolButton.h"
#import "UIColor+WYDemo.h"

@interface ToolScrollView()

@property(nonatomic, assign) NSInteger currentIndex;

@property(nonatomic, strong) NSArray *buttonArray;

@property(nonatomic, strong) UIView *indicatorView;

@end


@implementation ToolScrollView

-(UIView *)indicatorView{
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, toolScrollViewH - 3, [UIScreen mainScreen].bounds.size.width / minimumNum, 3)];
        _indicatorView.backgroundColor = [UIColor redColor];
    }
    return _indicatorView;
    
}

-(NSArray *)buttonArray{
    if (!_buttonArray) {
        _buttonArray = [NSArray array];
    }
    return _buttonArray;
}




-(instancetype)initWithFrame:(CGRect)frame configArray:(NSArray *)configArray{
    if (self == [super initWithFrame:frame]) {
        self.configArray = configArray;
        self.backgroundColor = [UIColor whiteColor];
        CGFloat commonWidth = [UIScreen mainScreen].bounds.size.width / minimumNum;
        NSMutableArray *tempArr = [NSMutableArray array];
        //添加buttonNum个按钮
        for (int i = 0; i < self.configArray.count; i++) {
            ToolButton *btn = [ToolButton buttonWithType:UIButtonTypeSystem];
            btn.frame = CGRectMake(commonWidth * i, 0, commonWidth, toolScrollViewH);
            btn.tag = i;
            [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
            NSDictionary *dict = self.configArray[i];
            [btn setTitle:[NSString stringWithFormat:@"%@", [dict objectForKey:@"CategoreTitle"]] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            [self addSubview:btn];
            [tempArr addObject:btn];
        }
        
        [self addSubview:self.indicatorView];
        
        self.buttonArray = tempArr;
    }
    return self;
}

-(void)changeIndicatorFrame:(CGFloat)shouldOffsetX fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex offsetRatio:(CGFloat)offsetRatio{
    if (offsetRatio > 1) {
        [UIView animateWithDuration:0.2f animations:^{
            self.indicatorView.frame = CGRectMake(shouldOffsetX, toolScrollViewH - 3, [UIScreen mainScreen].bounds.size.width / minimumNum, 3);
            
        }];
    }else{
        
        NSLog(@"fromIndex: %ld  toIndex: %ld", (long)fromIndex, (long)toIndex);
        UIButton *fromBtn = [self.buttonArray objectAtIndex:fromIndex];
        UIButton *toBtn = [self.buttonArray objectAtIndex:toIndex];
        [UIView animateWithDuration:0.2f animations:^{
            self.indicatorView.frame = CGRectMake(shouldOffsetX, toolScrollViewH - 3, [UIScreen mainScreen].bounds.size.width / minimumNum, 3);
            [fromBtn setTitleColor:RGB(255.0*(1-offsetRatio), 0, 0) forState:UIControlStateNormal];
            [toBtn setTitleColor:RGB(255.0*offsetRatio, 0, 0) forState:UIControlStateNormal];
        }];
    }
}


-(void)btnOnClickWithTag:(NSInteger)btnTag{
    
    self.option(btnTag);
    self.currentIndex = btnTag;
    for (ToolButton *btn in self.buttonArray) {
        if (btnTag == btn.tag) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    
    CGFloat commonWidth = [UIScreen mainScreen].bounds.size.width / minimumNum;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    BOOL dicision1 = commonWidth * btnTag + 1 < self.contentOffset.x;
    BOOL dicision2 = commonWidth * btnTag - 1 + commonWidth > self.contentOffset.x + screenWidth;
    
    BOOL dicision3 = commonWidth * btnTag - commonWidth < self.contentOffset.x;
    BOOL dicision4 = commonWidth * btnTag + 2 * commonWidth > self.contentOffset.x + screenWidth;
    CGFloat centerX = commonWidth * btnTag + commonWidth * 0.5;
    if (dicision1 ||dicision2) {
        if (centerX <= screenWidth/2 + self.contentOffset.x) {
            CGFloat leftPadding = commonWidth * btnTag;
            if (leftPadding >= (screenWidth - commonWidth)/2) {
                [self setContentOffset:CGPointMake(centerX - screenWidth * 0.5, 0) animated:YES];
            }else{
                [self setContentOffset:CGPointMake(0, 0) animated:YES];
            }
        }else{
            CGFloat rightPadding = (self.configArray.count - 1 - btnTag) * commonWidth;
            if (rightPadding >= (screenWidth - commonWidth)/2){
                [self setContentOffset:CGPointMake(centerX - screenWidth * 0.5, 0) animated:YES];
            }else{
                [self setContentOffset:CGPointMake(self.configArray.count * commonWidth - screenWidth, 0) animated:YES];
            }
        }
    }else{
        if (centerX - self.contentOffset.x < screenWidth/2) {
            if (btnTag == 0) {
                [self setContentOffset:CGPointMake(0, 0) animated:YES];
            }else{
                if (dicision3) {
                    CGFloat leftX = commonWidth * btnTag - commonWidth;
                    [self setContentOffset:CGPointMake(leftX, 0) animated:YES];
                }else{
                }
            }
            
        }else if(centerX - self.contentOffset.x > screenWidth/2){
            if (btnTag == self.configArray.count - 1) {
                [self setContentOffset:CGPointMake(self.configArray.count * commonWidth - screenWidth, 0) animated:YES];
            }else{
                if (dicision4) {
                    CGFloat rightX = commonWidth * btnTag + 2 * commonWidth;
                    [self setContentOffset:CGPointMake(rightX - screenWidth, 0) animated:YES];
                    
                }else{
                }
            }
            
        }else{
        }
    }
    
}

-(void)btnOnClick:(ToolButton *)btn{
    
    [self btnOnClickWithTag:btn.tag];
    
}



@end

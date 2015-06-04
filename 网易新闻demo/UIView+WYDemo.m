//
//  UIView+WYDemo.m
//  网易新闻demo
//
//  Created by user on 15-6-4.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "UIView+WYDemo.h"

@implementation UIView (WYDemo)
- (CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)top{
    return self.frame.origin.y;
}

- (CGFloat)left{
    return self.frame.origin.x;
}

- (CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (CGFloat)height{
    return self.frame.size.height;
}

@end

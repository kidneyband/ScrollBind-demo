//
//  HomeViewController.m
//  CKQ
//
//  Created by user on 6/2/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "HomeViewController.h"
#import "ToolScrollView.h"
#import "SubTableController.h"

@interface HomeViewController()<UIScrollViewDelegate>

@property(nonatomic, strong) NSArray *configArray;

@property(nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, strong) ToolScrollView *toolScrollView;

@property(nonatomic, assign) NSInteger selectedIndex;

@end



@implementation HomeViewController



- (void)viewDidLoad{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor clearColor];
    
    NSDictionary *dict0 = @{@"CategoreTitle": @"最新", @"url": @"http://www.google.com"};
    NSDictionary *dict1 = @{@"CategoreTitle": @"产品", @"url": @"http://www.google.com"};
    NSDictionary *dict2 = @{@"CategoreTitle": @"需求", @"url": @"http://www.google.com"};
    NSDictionary *dict3 = @{@"CategoreTitle": @"政策", @"url": @"http://www.google.com"};
    NSDictionary *dict4 = @{@"CategoreTitle": @"活动", @"url": @"http://www.google.com"};
    NSDictionary *dict5 = @{@"CategoreTitle": @"招聘", @"url": @"http://www.google.com"};
    //获取配置文件中的个数
    self.configArray = @[dict0, dict1, dict2, dict3, dict4, dict5];
    
    [self addTopToolScrollView: self.configArray];
    [self addBottomScrollView: self.configArray.count];
    [self.toolScrollView btnOnClickWithTag:0];

}

-(void)addTopToolScrollView:(NSArray *)array{
    
    //添加ToolScrollView
    self.toolScrollView = [[ToolScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, toolScrollViewH) configArray:self.configArray];
    self.toolScrollView.scrollsToTop = NO;
    self.toolScrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, toolScrollViewH);
    self.toolScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * array.count/minimumNum, toolScrollViewH);
    __weak typeof(self)weakSelf = self;
    [self.toolScrollView setOption:^(NSInteger index) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf.scrollView setContentOffset:CGPointMake(ScreenWidth * index, 0)];
        NSArray *array = strongSelf.childViewControllers;
        SubTableController *vc = [array objectAtIndex:index];
        [vc refreshData];
        //将数组中其他vc的ScrollToTop禁用掉
        for (int i = 0; i < array.count; i++) {
            SubTableController *tempVc = [array objectAtIndex:i];
            if (i == index) {
                tempVc.tableView.scrollsToTop = YES;
            }else{
                tempVc.tableView.scrollsToTop = NO;
            }
        }
    }];
    [self.view addSubview:self.toolScrollView];
    
    
}


-(void)addBottomScrollView:(NSInteger)number{
    //添加scrollView
    CGRect rect = CGRectMake(0, toolScrollViewH, self.view.bounds.size.width, self.view.bounds.size.height - 64 - toolScrollViewH);
    self.scrollView = [[UIScrollView alloc] initWithFrame:rect];
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.delegate = self;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
    [self addChildViewToScrollView:self.configArray];

}


-(void)addChildViewToScrollView:(NSArray *)array{
    
    //添加多少个vc
    NSInteger counts = array.count;
    CGRect rect = CGRectMake(0, toolScrollViewH, self.view.bounds.size.width, self.view.bounds.size.height - 64 - toolScrollViewH);
    rect.origin.y = 0;
    for (int i = 0; i < counts; i++) {
        UITableViewController *subVc = [[SubTableController alloc] init];
        rect.origin.x = rect.size.width * i;
        subVc.view.frame = rect;
        subVc.title = [NSString stringWithFormat:@"%d", i];
        [self addChildViewController:subVc];
        [self.scrollView addSubview:subVc.view];
    }
    NSLog(@"gaodu: %f", self.view.frame.size.height);
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * counts, rect.size.height);
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll");
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat shouldOffsetX = offsetX/minimumNum;
    [self.toolScrollView changeIndicatorFrame:shouldOffsetX];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating");
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    [self.toolScrollView btnOnClickWithTag:index];
    
    
}


@end

//
//  SubTableController.m
//  CKQ
//
//  Created by user on 15-6-2.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "SubTableController.h"
#import "HomeCell.h"

@interface SubTableController ()

@end

@implementation SubTableController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGFloat red = arc4random()%256/255.0;
    CGFloat blue = arc4random()%256/255.0;
    CGFloat green = arc4random()%256/255.0;
    self.tableView.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 210;
}

-(void)refreshData{
    //在这里应该判断，间隔多长时间
    NSLog(@"刷新数据");
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"homeCell";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}




@end

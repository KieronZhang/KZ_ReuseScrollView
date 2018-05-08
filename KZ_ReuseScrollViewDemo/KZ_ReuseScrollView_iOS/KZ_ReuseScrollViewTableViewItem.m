//
//  KZ_ReuseScrollViewTableViewItem.m
//  KZ_ReuseScrollView_iOS
//
//  Created by Kieron Zhang on 2018/5/8.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "KZ_ReuseScrollViewTableViewItem.h"

@implementation KZ_ReuseScrollViewTableViewItem

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        reuseTableView = [[UITableView alloc] initWithFrame:self.bounds];
        reuseTableView.delegate = self;
        reuseTableView.dataSource = self;
        [self addSubview:reuseTableView];
    }
    return self;
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
}

- (void)prepareForReuse {
    [reuseTableView reloadData];
    reuseTableView.contentOffset = CGPointZero;
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *TableViewCell = @"TableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableViewCell];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", @(self.currentIndex), @(indexPath.row)];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", @(self.currentIndex), @(indexPath.row)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"didSelect  %@ - %@", @(self.currentIndex), @(indexPath.row));
}

@end

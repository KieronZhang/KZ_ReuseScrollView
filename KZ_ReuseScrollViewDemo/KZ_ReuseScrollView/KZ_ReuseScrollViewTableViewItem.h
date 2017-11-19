//
//  KZ_ReuseScrollViewTableViewItem.h
//  KZ_ReuseScrollView
//
//  Created by Kieron Zhang on 2017/3/31.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <KZ_ReuseScrollViewFramework/KZ_ReuseScrollViewItem.h>

@interface KZ_ReuseScrollViewTableViewItem : KZ_ReuseScrollViewItem <UITableViewDelegate, UITableViewDataSource> {
    UITableView *reuseTableView;
}
@property (nonatomic, assign) NSInteger currentIndex;

@end

//
//  KZ_ReuseScrollViewTableViewItem.h
//  KZ_ReuseScrollView_iOS
//
//  Created by Kieron Zhang on 2018/5/8.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import <KZ_ReuseScrollView_iOS/KZ_ReuseScrollViewItem.h>

@interface KZ_ReuseScrollViewTableViewItem : KZ_ReuseScrollViewItem <UITableViewDelegate, UITableViewDataSource> {
    UITableView *reuseTableView;
}
@property (nonatomic, assign) NSInteger currentIndex;

@end

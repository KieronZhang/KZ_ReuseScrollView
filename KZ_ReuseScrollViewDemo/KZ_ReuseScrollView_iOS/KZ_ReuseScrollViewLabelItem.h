//
//  KZ_ReuseScrollViewLabelItem.h
//  KZ_ReuseScrollView_iOS
//
//  Created by Kieron Zhang on 2018/5/8.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import <KZ_ReuseScrollView_iOS/KZ_ReuseScrollViewItem.h>

@interface KZ_ReuseScrollViewLabelItem : KZ_ReuseScrollViewItem {
    UILabel *label;
}
@property (nonatomic, assign) NSInteger currentIndex;

@end

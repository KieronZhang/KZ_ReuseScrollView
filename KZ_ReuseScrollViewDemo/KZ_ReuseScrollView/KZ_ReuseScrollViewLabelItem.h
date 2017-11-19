//
//  KZ_ReuseScrollViewLabelItem.h
//  KZ_ReuseScrollView
//
//  Created by Kieron Zhang on 2017/3/29.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <KZ_ReuseScrollViewFramework/KZ_ReuseScrollViewItem.h>

@interface KZ_ReuseScrollViewLabelItem : KZ_ReuseScrollViewItem {
    UILabel *label;
}
@property (nonatomic, assign) NSInteger currentIndex;

@end

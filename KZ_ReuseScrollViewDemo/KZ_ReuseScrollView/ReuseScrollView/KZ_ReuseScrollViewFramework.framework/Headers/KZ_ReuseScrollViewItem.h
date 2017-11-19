//
//  KZ_ReuseScrollViewItem.h
//  KZ_ReuseScrollView
//
//  Created by Kieron Zhang on 2017/3/29.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KZ_ReuseScrollViewItem : UIView

#pragma mark overwrite
- (void)prepareForReuse;
- (void)prepareForRecycle;

@end

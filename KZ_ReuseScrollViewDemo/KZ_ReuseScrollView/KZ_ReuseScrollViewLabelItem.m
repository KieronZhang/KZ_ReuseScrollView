//
//  KZ_ReuseScrollViewLabelItem.m
//  KZ_ReuseScrollView
//
//  Created by Kieron Zhang on 2017/3/29.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "KZ_ReuseScrollViewLabelItem.h"

@implementation KZ_ReuseScrollViewLabelItem

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        label = [[UILabel alloc] initWithFrame:self.bounds];
        label.font = [UIFont systemFontOfSize:20.0f];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return self;
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
}

- (void)prepareForReuse {
    label.text = @(self.currentIndex).stringValue;
}

- (void)prepareForRecycle {
    NSLog(@"%@", @(self.currentIndex).stringValue);
}

@end

//
//  KZ_ReuseScrollView.h
//  KZ_ReuseScrollView
//
//  Created by Kieron Zhang on 2017/3/29.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KZ_ReuseScrollViewItem.h"

typedef NS_ENUM(NSInteger, KZ_ReuseScrollViewDirection) {
    KZ_ReuseScrollViewDirection_Horizontal = 1,
    KZ_ReuseScrollViewDirection_Vertical = 2,
};

@class KZ_ReuseScrollView;

@protocol KZ_ReuseScrollViewDelegate <NSObject, UIScrollViewDelegate>

@optional
- (void)reuseScrollView:(nonnull KZ_ReuseScrollView *)reuseScrollView willDisplayItem:(nullable KZ_ReuseScrollViewItem *)item atIndex:(NSInteger)index;
- (void)reuseScrollView:(nonnull KZ_ReuseScrollView *)reuseScrollView didEndDisplayingItem:(nullable KZ_ReuseScrollViewItem *)item atIndex:(NSInteger)index;

- (void)reuseScrollView:(nonnull KZ_ReuseScrollView *)reuseScrollView didSingleTapItem:(nullable KZ_ReuseScrollViewItem *)item atIndex:(NSInteger)index tapGestureRecognizer:(nullable UITapGestureRecognizer *)gesture;
- (void)reuseScrollView:(nonnull KZ_ReuseScrollView *)reuseScrollView didDoubleTapItem:(nullable KZ_ReuseScrollViewItem *)item atIndex:(NSInteger)index tapGestureRecognizer:(nullable UITapGestureRecognizer *)gesture;
- (void)reuseScrollView:(nonnull KZ_ReuseScrollView *)reuseScrollView didLongPressItem:(nullable KZ_ReuseScrollViewItem *)item atIndex:(NSInteger)index longPressGestureRecognizer:(nullable UILongPressGestureRecognizer *)gesture;

@end

@protocol KZ_ReuseScrollViewDataSource <NSObject>

- (NSInteger)numberOfViewsInReuseScrollView:(nonnull KZ_ReuseScrollView *)reuseScrollView;
- (nonnull KZ_ReuseScrollViewItem *)reuseScrollView:(nonnull KZ_ReuseScrollView *)reuseScrollView itemForRowAtIndex:(NSInteger)index;

@end

@interface KZ_ReuseScrollView : UIScrollView

@property (nonatomic, weak, nullable) id<KZ_ReuseScrollViewDelegate> delegate;
@property (nonatomic, weak, nullable) id<KZ_ReuseScrollViewDataSource> dataSource;

@property (nonatomic, assign) KZ_ReuseScrollViewDirection direction;
@property (nonatomic, assign) NSInteger perSideCount;
@property (nonatomic, assign) CGFloat itemDistance;
@property (nonatomic, assign) BOOL singleTapGestureEnable;
@property (nonatomic, assign) BOOL doubleTapGestureEnable;
@property (nonatomic, assign) BOOL longPressGestureEnable;

@property (nonatomic, assign, readonly) NSInteger currentIndex;

- (nonnull instancetype)initWithFrame:(CGRect)frame direction:(KZ_ReuseScrollViewDirection)direction;

- (void)registerClass:(nonnull Class)itemClass forItemWithReuseIdentifier:(nonnull NSString *)identifier;

- (nullable __kindof KZ_ReuseScrollViewItem *)itemForRowAtIndex:(NSInteger)index;
- (nullable __kindof KZ_ReuseScrollViewItem *)dequeueReusableItemWithIdentifier:(nullable NSString *)identifier index:(NSInteger)index;

- (void)reloadData;
- (void)insertIndexes:(nonnull NSArray<NSNumber *> *)indexes;
- (void)deleteIndexes:(nonnull NSArray<NSNumber *> *)indexes;
- (void)reloadIndexes:(nonnull NSArray<NSNumber *> *)indexes;

@end

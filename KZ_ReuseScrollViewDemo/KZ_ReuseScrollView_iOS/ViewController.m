//
//  ViewController.m
//  KZ_ReuseScrollView_iOS
//
//  Created by Kieron Zhang on 2018/5/8.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "ViewController.h"
#import "KZ_ReuseScrollViewLabelItem.h"
#import "KZ_ReuseScrollViewTableViewItem.h"
#import <KZ_ReuseScrollView_iOS/KZ_ReuseScrollView.h>

@interface ViewController () <KZ_ReuseScrollViewDelegate, KZ_ReuseScrollViewDataSource> {
    KZ_ReuseScrollView *mainReuseScrollView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    itemArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 10; i++) {
        [itemArray addObject:@(i)];
    }
    
    mainReuseScrollView = [[KZ_ReuseScrollView alloc] initWithFrame:self.view.bounds];
    mainReuseScrollView.delegate = self;
    mainReuseScrollView.dataSource = self;
    mainReuseScrollView.pagingEnabled = YES;
    mainReuseScrollView.perSideCount = 2;
    mainReuseScrollView.itemDistance = 100.0f;
    [self.view addSubview:mainReuseScrollView];
    [mainReuseScrollView registerClass:[KZ_ReuseScrollViewLabelItem class] forItemWithReuseIdentifier:@"ReuseScrollViewLabelItem"];
    [mainReuseScrollView registerClass:[KZ_ReuseScrollViewTableViewItem class] forItemWithReuseIdentifier:@"ReuseScrollViewTableViewItem"];
    [mainReuseScrollView reloadData];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.backgroundColor = [UIColor greenColor];
    addButton.frame = CGRectMake(20, 20, (CGRectGetWidth(self.view.bounds) - 80) / 3, 100);
    [addButton setTitle:@"Add" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteButton.backgroundColor = [UIColor orangeColor];
    deleteButton.frame = CGRectMake(CGRectGetMaxX(addButton.frame) + 20, 20, (CGRectGetWidth(self.view.bounds) - 80) / 3, 100);
    [deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(deleteButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteButton];
    
    UIButton *reloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    reloadButton.backgroundColor = [UIColor yellowColor];
    reloadButton.frame = CGRectMake(CGRectGetMaxX(deleteButton.frame) + 20, 20, (CGRectGetWidth(self.view.bounds) - 80) / 3, 100);
    [reloadButton setTitle:@"Reload" forState:UIControlStateNormal];
    [reloadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [reloadButton addTarget:self action:@selector(reloadButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reloadButton];
}

- (void)reloadButtonTapped {
    [itemArray removeObjectAtIndex:0];
    [itemArray insertObject:@(100) atIndex:0];
    [itemArray removeObjectAtIndex:1];
    [itemArray insertObject:@(200) atIndex:1];
    [mainReuseScrollView reloadIndexes:@[@(0), @(1)]];
}

- (void)addButtonTapped {
    [itemArray insertObject:@(100) atIndex:0];
    [mainReuseScrollView insertIndexes:@[@(0)]];
}

- (void)deleteButtonTapped {
    [itemArray removeObjectAtIndex:2];
    [mainReuseScrollView deleteIndexes:@[@(2)]];
}

#pragma mark KZ_ReuseScrollViewDelegate
- (NSInteger)numberOfViewsInReuseScrollView:(KZ_ReuseScrollView *)reuseScrollView {
    return itemArray.count;
}

- (KZ_ReuseScrollViewItem *)reuseScrollView:(KZ_ReuseScrollView *)reuseScrollView itemForRowAtIndex:(NSInteger)index {
    //    if (index % 2 == 0) {
    static NSString *ReuseScrollViewLabelItem = @"ReuseScrollViewLabelItem";
    KZ_ReuseScrollViewLabelItem *item = [reuseScrollView dequeueReusableItemWithIdentifier:ReuseScrollViewLabelItem index:index];
    item.backgroundColor = [UIColor colorWithRed:0xff green:0x00 blue:0x00 alpha:0.3f];
    item.alpha = 0.5f;
    item.currentIndex = [itemArray[index] integerValue];
    return item;
    //    }
    //    else {
    //        static NSString *ReuseScrollViewTableViewItem = @"ReuseScrollViewTableViewItem";
    //        KZ_ReuseScrollViewTableViewItem *item = [reuseScrollView dequeueReusableItemWithIdentifier:ReuseScrollViewTableViewItem index:index];
    //        item.currentIndex = [itemArray[index] integerValue];
    //        return item;
    //    }
}

- (void)reuseScrollView:(KZ_ReuseScrollView *)reuseScrollView willDisplayItem:(KZ_ReuseScrollViewItem *)item atIndex:(NSInteger)index {
    NSLog(@"willDisplay  %@", @(index));
}

- (void)reuseScrollView:(KZ_ReuseScrollView *)reuseScrollView didEndDisplayingItem:(KZ_ReuseScrollViewItem *)item atIndex:(NSInteger)index {
    NSLog(@"didEndDisplaying  %@", @(index));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

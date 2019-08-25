//
//  KLTableViewContainerSectionItem.m
//  klook
//
//  Created by yancy.chen on 2019/8/1.
//  Copyright © 2019 klook. All rights reserved.
//

#import "KLTableViewContainerSectionItem.h"

@implementation KLTableViewContainerSectionItem

- (instancetype)initWithItemArray:(NSArray<KLTableViewContainerCellItem *> *)itemArray
                       sectionTag:(NSString *)sectionTag {
    if (self = [super init]) {
        self.itemArray = [self checkCellItemValid:itemArray];;
        self.sectionTag = sectionTag;
    }
    return self;
}

- (NSArray<KLTableViewContainerCellItem *> *)checkCellItemValid:(NSArray<KLTableViewContainerCellItem *> *)itemArray {
    if (!itemArray.count) {
        return [NSArray array];
    }
    NSMutableSet *tagSet = [NSMutableSet set];
#if DEBUG
    for (KLTableViewContainerCellItem *item in itemArray) {
        NSAssert([item isKindOfClass:KLTableViewContainerCellItem.class], @"Invalid type");
        NSAssert(![tagSet containsObject:item.cellTag], @"Repeat cellTag");
        [tagSet addObject:item.cellTag];
    }
    return itemArray;
#else
    NSMutableArray *mutItems = [NSMutableArray arrayWithCapacity:itemArray.count];
    for (KLTableViewContainerCellItem *item in itemArray) {
        // 过滤无效CellItem
        if ([item isKindOfClass:KLTableViewContainerCellItem.class] &&
            ![tagSet containsObject:item.cellTag]) {
            [mutItems addObject:item];
        }
        [tagSet addObject:item.cellTag];
    }
    return [mutItems copy];
#endif
}

- (void)registerSectionCellForTableView:(UITableView *)tableView {
    if (tableView) {
        for (KLTableViewContainerCellItem *cellItem in self.itemArray) {
            if (![cellItem isKindOfClass:KLTableViewContainerCellItem.class]) {
                return;
            }
            if (![cellItem respondsToSelector:@selector(registerCellForTableView:)]) {
                return;
            }
            [cellItem registerCellForTableView:tableView];
        }
    } else {
        NSAssert(NO, @"tableView 不能为空 ！！");
    }
}


@end

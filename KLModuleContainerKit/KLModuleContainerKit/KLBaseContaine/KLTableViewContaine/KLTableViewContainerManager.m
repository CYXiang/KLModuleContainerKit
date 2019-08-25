//
//  KLTableViewContainerManager.m
//  klook
//
//  Created by yancy.chen on 2019/8/1.
//  Copyright © 2019 klook. All rights reserved.
//

#import "KLTableViewContainerManager.h"
//#import "KLCommonImport.h"

@interface KLTableViewContainerManager ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray<KLTableViewContainerSectionItem *> *sectionItemArray;

@end


@implementation KLTableViewContainerManager

- (void)tableViewContainerReloadData {
    
    if ([self.dataSource respondsToSelector:@selector(configTableContainerWithSectionItems)]) {
        NSArray<KLTableViewContainerSectionItem *> *items = [self.dataSource configTableContainerWithSectionItems];
        
        [self.sectionItemArray removeAllObjects];
        [self.sectionItemArray addObjectsFromArray:[self checkSectionItemsValid:items]];
        
        // 统一注册 Cell
        for (KLTableViewContainerSectionItem *sectionItem in items) {
            [sectionItem registerSectionCellForTableView:self.tableView];
        }
        
        [self.tableView reloadData];
    } else {
        NSAssert(NO, @"需要实现 configTableContainerWithSectionItems 方法");
    }
}

- (NSArray<KLTableViewContainerSectionItem *> *)checkSectionItemsValid:(NSArray<KLTableViewContainerSectionItem *> *)sections {
    if (!sections.count) {
        return [NSArray array];
    }
    NSMutableSet *set = [NSMutableSet set];
#if DEBUG
    for (KLTableViewContainerSectionItem *section in sections) {
        NSAssert([section isKindOfClass:KLTableViewContainerSectionItem.class], @"存在非 KLTableViewContainerSectionItem 实例");
        NSAssert(![set containsObject:section.sectionTag], @"setionTag 重复: %@", section.sectionTag);
        [set addObject:section.sectionTag];
    }
    return sections;
#else
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:sections.count];
    for (KLTableViewContainerSectionItem *section in sections) {
        // 过滤无效 Section
        if ([section isKindOfClass:KLTableViewContainerSectionItem.class] &&
            ![set containsObject:section.sectionTag]) {
            [array addObject:section];
        }
        [set addObject:section.sectionTag];
    }
    return [array copy];
#endif
 
}


/**
 刷新指定 Section 数据
 */
- (void)reloadSectionWithCellItems:(NSArray<KLTableViewContainerCellItem *> *)cellItems
                        sectionTag:(NSString *)sectionTag {

    NSInteger sectionNum = -1;
    KLTableViewContainerSectionItem *item = nil;
    
    for (NSInteger i = 0; i < self.sectionItemArray.count; i++) {
        item = self.sectionItemArray[i];
        if ([item.sectionTag isEqualToString:sectionTag]) {
            item.itemArray = cellItems;
            sectionNum = i;
            break;
        }
    }

    if (sectionNum == -1) {
        NSAssert(NO, @"没有找到 sectionTag : %@",sectionTag);
    } else {
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sectionNum] withRowAnimation:UITableViewRowAnimationNone];
    }
}

/**
 刷新指定 Cell 数据
 */
- (void)reloadCellDataWithModel:(id)model
                     sectionTag:(NSString *)sectionTag
                        cellTag:(NSString *)cellTag {
    
    NSInteger sectionIndex = -1;
    NSInteger rowIndex = -1;
    KLTableViewContainerSectionItem *sectionItem = nil;
    
    // 获取 section 位置
    for (NSInteger i = 0; i < self.sectionItemArray.count; i++) {
        KLTableViewContainerSectionItem *item = self.sectionItemArray[i];
        if ([item.sectionTag isEqualToString:sectionTag]) {
            sectionIndex = i;
            sectionItem = item;
            break;
        }
    }
    if (!sectionItem) {
        NSAssert(NO, @"没有找到 sectionTag : %@",sectionTag);
        return;
    }
    
    // 获取 Row 位置
    for (NSInteger i = 0; i < sectionItem.itemArray.count; i++) {
        KLTableViewContainerCellItem *item = sectionItem.itemArray[i];
        if ([item.cellTag isEqualToString:cellTag]) {
            rowIndex = i;
            item.model = model;
            break;
        }
    }
    
    if (rowIndex == -1) {
        NSAssert(NO, @"没有找到 cellTag : %@",cellTag);
    } else {
        [UIView performWithoutAnimation:^{
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex]] withRowAnimation:UITableViewRowAnimationFade];
        }];
    }
    
}

#pragma mark - 动态操作视图Section相关方法

/**
 动态插入一个 Section （注意处理数组越界问题）
 
 @param sectionItem 模块Item
 @param sectionIndex 位置Index
 */
- (void)insertSectionWithSectionItem:(KLTableViewContainerSectionItem *)sectionItem
                        sectionIndex:(NSInteger)sectionIndex {
    
    [sectionItem registerSectionCellForTableView:self.tableView];
    
    if (sectionIndex < 0) {
        sectionIndex = 0;
    }
    if (sectionIndex > self.sectionItemArray.count) {
        sectionIndex = self.sectionItemArray.count;
    }
    // 插入数据
    [self.sectionItemArray insertObject:sectionItem atIndex:sectionIndex];
    
    // 插入Section
    [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
}

/**
 动态在 sectionTag 上方插入一个 Section
 */
- (void)insertSectionWithSectionItem:(KLTableViewContainerSectionItem *)sectionItem
                     aboveSectionTag:(NSString *)sectionTag {
    
    NSInteger index = [self findIndexWithSectionTag:sectionTag];
    if (index == NSNotFound) {
        NSAssert(NO, @"请检查传入 sectionTag 是否存在！");
    } else {
        [self insertSectionWithSectionItem:sectionItem sectionIndex:(index - 1)];
    }
}

/**
 动态在 sectionTag 下方插入一个 Section
 */
- (void)insertSectionWithSectionItem:(KLTableViewContainerSectionItem *)sectionItem
                     underSectionTag:(NSString *)sectionTag {
    
    NSInteger index = [self findIndexWithSectionTag:sectionTag];
    if (index == NSNotFound) {
        NSAssert(NO, @"请检查传入 sectionTag 是否存在！");
    } else {
        [self insertSectionWithSectionItem:sectionItem sectionIndex:(index + 1)];
    }

}

/**
 动态移除指定 Section
 */
- (void)removeSectionWithSectionTag:(NSString *)sectionTag {
    
    NSInteger index = [self findIndexWithSectionTag:sectionTag];
    if (index == NSNotFound) {
        NSAssert(NO, @"请检查传入 sectionTag 是否存在！");
    } else {
        [self.sectionItemArray removeObjectAtIndex:index];
        [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationFade];
    }

}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sectionItemArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    KLTableViewContainerSectionItem *sectionItem = self.sectionItemArray[section];
    return sectionItem.itemArray.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    KLTableViewContainerSectionItem *sectionItem = [self.sectionItemArray objectAtIndex:indexPath.section];
    KLTableViewContainerCellItem *cellItem = [sectionItem.itemArray objectAtIndex:indexPath.row];
    
    cell = [cellItem dequeueTableViewCellWithIndexPath:indexPath tableView:tableView];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KLTableViewContainerSectionItem *item = [self.sectionItemArray objectAtIndex:indexPath.section];
    
    if ([self.delegate respondsToSelector:@selector(containerManager:didSelectItem:atRowIndex:)]) {
        [self.delegate containerManager:self didSelectItem:item atRowIndex:indexPath.row];
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat rowHeight = UITableViewAutomaticDimension;
    
    KLTableViewContainerSectionItem *sectionItem = [self.sectionItemArray objectAtIndex:indexPath.section];
    KLTableViewContainerCellItem *cellItem = [sectionItem.itemArray objectAtIndex:indexPath.row];

    rowHeight = [cellItem heightForRowAtIndexPath:indexPath tableView:tableView];
    
    return rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    // TODO:

    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    // TODO:

    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    // TODO:
    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    // TODO:

    return nil;
}

#pragma mark - private method

- (NSInteger)findIndexWithSectionTag:(NSString *)sectionTag {
    
    for (NSInteger i = 0; i < self.sectionItemArray.count; i++) {
        KLTableViewContainerSectionItem *item = self.sectionItemArray[i];
        if ([item.sectionTag isEqualToString:sectionTag]) {
            return i;
        }
    }
    return NSNotFound;
}

#pragma mark - getter/setter

- (NSMutableArray<KLTableViewContainerSectionItem *> *)sectionItemArray {
    if (!_sectionItemArray) {
        _sectionItemArray = [NSMutableArray array];
    }
    return _sectionItemArray;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return _tableView;
}

@end

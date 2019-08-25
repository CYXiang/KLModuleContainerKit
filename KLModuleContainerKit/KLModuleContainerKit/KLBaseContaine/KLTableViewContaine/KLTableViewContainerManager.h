//
//  KLTableViewContainerManager.h
//  klook
//
//  Created by yancy.chen on 2019/8/1.
//  Copyright © 2019 klook. All rights reserved.
//

#import "KLTableViewContainerSectionItem.h"

@class KLTableViewContainerManager;

NS_ASSUME_NONNULL_BEGIN

@protocol KLTableViewContainerDataSource <NSObject>

@required

- (NSMutableArray<KLTableViewContainerSectionItem *> *)configTableContainerWithSectionItems;

@end

@protocol KLTableViewContainerDelegate <NSObject>

@optional

- (void)containerManager:(KLTableViewContainerManager *)containerManager
           didSelectItem:(KLTableViewContainerSectionItem *)sectionItem
              atRowIndex:(NSInteger)rowIndex;

@end


@interface KLTableViewContainerManager : NSObject

@property (nonatomic, weak  ) id<KLTableViewContainerDataSource> dataSource;
@property (nonatomic, weak  ) id<KLTableViewContainerDelegate> delegate;

@property (nonatomic, strong, readonly) UITableView *tableView;
@property (nonatomic, strong, readonly) NSMutableArray<KLTableViewContainerSectionItem *> *sectionItemArray;

#pragma mark - 更新视图相关方法

- (void)tableViewContainerReloadData;

/**
 刷新指定 Section 数据
 */
- (void)reloadSectionWithCellItems:(NSArray<KLTableViewContainerCellItem *> *)cellItems
                        sectionTag:(NSString *)sectionTag;

/**
 刷新指定 Cells 数据
 */
- (void)reloadCellDataWithModel:(id)model
                     sectionTag:(NSString *)sectionTag
                        cellTag:(NSString *)cellTag;

#pragma mark - 动态操作视图Section相关方法

/**
 动态插入一个 Section （注意处理数组越界问题）
 
 @param sectionItem 模块Item
 @param sectionIndex 位置Index
 */
- (void)insertSectionWithSectionItem:(KLTableViewContainerSectionItem *)sectionItem
                        sectionIndex:(NSInteger)sectionIndex;

/**
 动态在 sectionTag 上方插入一个 Section
 */
- (void)insertSectionWithSectionItem:(KLTableViewContainerSectionItem *)sectionItem
                     aboveSectionTag:(NSString *)sectionTag;

/**
 动态在 sectionTag 下方插入一个 Section
 */
- (void)insertSectionWithSectionItem:(KLTableViewContainerSectionItem *)sectionItem
                     underSectionTag:(NSString *)sectionTag;

/**
 动态移除指定 Section
 */
- (void)removeSectionWithSectionTag:(NSString *)sectionTag;


@end

NS_ASSUME_NONNULL_END

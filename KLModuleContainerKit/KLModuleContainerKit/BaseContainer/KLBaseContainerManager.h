//
//  KLBaseContainerManager.h
//  klook
//
//  Created by yancy.chen on 2019/6/13.
//  Copyright © 2019 klook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLBaseContainerViewSectionItem.h"

NS_ASSUME_NONNULL_BEGIN

@protocol KLBaseContainerManagerDelegate <NSObject>

@optional

- (void)baseContainerViewDidSelectItem:(KLBaseContainerViewSectionItem *)sectionItem atRowIndex:(NSInteger)rowIndex;

- (UICollectionReusableView *)baseContainerManager:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath sectionItem:(KLBaseContainerViewSectionItem *)sectionItem;

- (CGSize)baseContainerManager:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section sectionItem:(KLBaseContainerViewSectionItem *)sectionItem;


@end


@interface KLBaseContainerManager : NSObject

@property (nonatomic, weak  ) id<KLBaseContainerManagerDelegate> delegate;

- (UICollectionView *)getCollectionView;

// 配置数据源

/**
 配置数据源
 */
- (void)configBaseContainerWithItems:(NSArray<KLBaseContainerViewSectionItem *> *)items;


/**
 刷新指定 Section 数据
 */
- (void)reloadSectionsWithModelArray:(NSArray *)modelArray sectionTag:(NSString *)sectionTag;


/**
 动态插入一个 Section
 */
- (void)insertSectionsWithSectionItem:(KLBaseContainerViewSectionItem *)sectionItem sectionIndex:(NSInteger)sectionIndex;

@end

NS_ASSUME_NONNULL_END

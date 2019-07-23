//
//  KLBaseContainerViewSectionItem.h
//  klook
//
//  Created by yancy.chen on 2019/6/14.
//  Copyright © 2019 klook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface KLBaseContainerViewSectionItem : NSObject

#pragma mark - 构造 SectionItem 需要传的属性

/// ====================== @required 必传  ====================== ///

/// Data 部分
@property (nonatomic, strong) NSArray *modelArray; // 数据 Model<NSArray>

/// UI 部分
@property (nonatomic, copy  ) NSString *cellViewClassStr; // CollectionCell 类名
@property (nonatomic, copy  ) NSString *sectionTag; // section 标识 （用于区分相同 CellClass 在不同的 Section 时数据渲染）


/// ====================== @optional 可选  ====================== ///

@property (nonatomic, copy  , nullable) NSString *headerViewClassStr; // headerViewClassStr 类名


#pragma mark - 给 BaseContainerManager 使用

@property (nonatomic, assign, readonly) UIEdgeInsets cellEdgeInsets;

- (void)registerCellForCollectionView:(UICollectionView *)collectionView;

- (UICollectionViewCell *)dequeueReusableCellWithIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END

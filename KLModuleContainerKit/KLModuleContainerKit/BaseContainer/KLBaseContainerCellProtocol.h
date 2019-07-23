//
//  KLBaseContainerCellProtocol.h
//  klook
//
//  Created by yancy.chen on 2019/6/14.
//  Copyright © 2019 klook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KLBaseContainerCellProtocol <NSObject>

@required

// 注册 Cell 到 View 中
- (void)registerCellWithCollectionView:(UICollectionView *)collectionView;

// 更新数据
- (void)setModel:(id)model;

// 获取Cell Insets
- (UIEdgeInsets)getCellEdgeInsets;

@end

NS_ASSUME_NONNULL_END

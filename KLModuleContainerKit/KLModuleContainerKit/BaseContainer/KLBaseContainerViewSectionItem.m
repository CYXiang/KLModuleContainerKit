//
//  KLBaseContainerViewSectionItem.m
//  klook
//
//  Created by yancy.chen on 2019/6/14.
//  Copyright © 2019 klook. All rights reserved.
//

#import "KLBaseContainerViewSectionItem.h"
#import "KLBaseContainerCellProtocol.h"
#import "UICollectionView+KLExtension.h"

@interface KLBaseContainerViewSectionItem ()

@property (nonatomic, strong) id<KLBaseContainerCellProtocol> collectionCell;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation KLBaseContainerViewSectionItem


- (UIEdgeInsets)cellEdgeInsets {
    
    if ([self.collectionCell respondsToSelector:@selector(getCellEdgeInsets)]) {
        return [self.collectionCell getCellEdgeInsets];
    }
    return UIEdgeInsetsZero;
}

- (void)registerCellForCollectionView:(UICollectionView *)collectionView {
    
    self.collectionView = collectionView;
    
    Class cellClass = NSClassFromString(self.cellViewClassStr);
    self.collectionCell = [cellClass new];
    
    if ([self.collectionCell respondsToSelector:@selector(registerCellWithCollectionView:)]) {
        [self.collectionCell registerCellWithCollectionView:self.collectionView];
    }
}

- (UICollectionViewCell *)dequeueReusableCellWithIndexPath:(NSIndexPath *)indexPath {
    
    self.collectionCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:self.cellViewClassStr forIndexPath:indexPath];
    if ([self.collectionCell respondsToSelector:@selector(setModel:)]) {
        [self.collectionCell setModel:_modelArray[indexPath.row]];
    }
    
    return (UICollectionViewCell *)self.collectionCell;
}



@end

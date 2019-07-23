//
//  KLBaseContainerManager.m
//  klook
//
//  Created by yancy.chen on 2019/6/13.
//  Copyright © 2019 klook. All rights reserved.
//

#import "KLBaseContainerManager.h"
//#import "KLCommonImport.h"
#import "KLBaseContainerCellProtocol.h"

@interface KLBaseContainerManager ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray<KLBaseContainerViewSectionItem *> *sectionItemArray;

@end

@implementation KLBaseContainerManager

- (UICollectionView *)getCollectionView {
    return self.collectionView;
}

- (void)configBaseContainerWithItems:(NSArray<KLBaseContainerViewSectionItem *> *)items {
    
    [self.sectionItemArray removeAllObjects];
    [self.sectionItemArray addObjectsFromArray:items];
    
    // 统一注册 Cell
    [self.sectionItemArray makeObjectsPerformSelector:@selector(registerCellForCollectionView:) withObject:self.collectionView];
    
    [self.getCollectionView reloadData];
}

- (void)reloadSectionsWithModelArray:(NSArray *)modelArray sectionTag:(NSString *)sectionTag {
    for (NSInteger i = 0; i < self.sectionItemArray.count; i++) {
        KLBaseContainerViewSectionItem *item = self.sectionItemArray[i];
        if ([item.sectionTag isEqualToString:sectionTag]) {
            item.modelArray = modelArray;
            [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:i]];
        }
    }
}

- (void)insertSectionsWithSectionItem:(KLBaseContainerViewSectionItem *)sectionItem sectionIndex:(NSInteger)sectionIndex {
    
    [sectionItem registerCellForCollectionView:self.collectionView];
    
    if (sectionIndex < 0) {
        sectionIndex = 0;
    }
    if (sectionIndex > self.sectionItemArray.count) {
        sectionIndex = self.sectionItemArray.count;
    }
    
    [self.sectionItemArray insertObject:sectionItem atIndex:sectionIndex];
    [self.collectionView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]];
}


#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.sectionItemArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger number = 0;
    KLBaseContainerViewSectionItem *item = [self.sectionItemArray objectAtIndex:section];
    NSArray *array = item.modelArray;
    number = array.count;
    return number;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell;
    KLBaseContainerViewSectionItem *item = [self.sectionItemArray objectAtIndex:indexPath.section];
    cell = [item dequeueReusableCellWithIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    KLBaseContainerViewSectionItem *item = [self.sectionItemArray objectAtIndex:indexPath.section];

    if ([self.delegate respondsToSelector:@selector(baseContainerViewDidSelectItem:atRowIndex:)]) {
        [self.delegate baseContainerViewDidSelectItem:item atRowIndex:indexPath.row];
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    KLBaseContainerViewSectionItem *item = [self.sectionItemArray objectAtIndex:section];
    return item.cellEdgeInsets;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    KLBaseContainerViewSectionItem *item = [self.sectionItemArray objectAtIndex:indexPath.section];

    if ([self.delegate respondsToSelector:@selector(baseContainerManager:viewForSupplementaryElementOfKind:atIndexPath:sectionItem:)]) {
        return [self.delegate baseContainerManager:collectionView viewForSupplementaryElementOfKind:kind atIndexPath:indexPath sectionItem:item];
    }
    
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    KLBaseContainerViewSectionItem *item = [self.sectionItemArray objectAtIndex:section];

    if ([self.delegate respondsToSelector:@selector(baseContainerManager:layout:referenceSizeForHeaderInSection:sectionItem:)]) {
        return [self.delegate baseContainerManager:collectionView layout:collectionViewLayout referenceSizeForHeaderInSection:section sectionItem:item];
    }
    
    return CGSizeZero;
}


#pragma mark - getter/setter

- (NSMutableArray<KLBaseContainerViewSectionItem *> *)sectionItemArray {
    if (!_sectionItemArray) {
        _sectionItemArray = [NSMutableArray array];
    }
    return _sectionItemArray;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {

        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.estimatedItemSize = CGSizeMake(kScreenWidth, 0);

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}

@end


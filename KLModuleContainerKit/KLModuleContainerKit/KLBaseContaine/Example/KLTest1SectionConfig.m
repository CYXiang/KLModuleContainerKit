//
//  KLTest1SectionConfig.m
//  klook
//
//  Created by yancy.chen on 2019/8/2.
//  Copyright © 2019 klook. All rights reserved.
//

#import "KLTest1SectionConfig.h"


@implementation KLTest1SectionConfig

+ (KLTableViewContainerSectionItem *)setUpTestSectionNewItemWithModel:(NSString *)model sectionTag:(NSString *)sectionTag {
    
    
    NSMutableArray *cellItemArray = [NSMutableArray array];

   
    KLTableViewContainerSectionItem *sectionItem = [[KLTableViewContainerSectionItem alloc] initWithItemArray:cellItemArray sectionTag:sectionTag];
    
    return sectionItem;
}

+ (KLTableViewContainerSectionItem *)setUpTestSectionItemWithModel:(NSString *)model sectionTag:(NSString *)sectionTag {

   
    NSMutableArray *cellItemArray = [NSMutableArray array];
    
    
//    KLTableViewContainerCellItem *cellItem1 = [KLTableViewContainerCellItem new];
//    cellItem1.cellTag = @"header";
//    cellItem1.cellViewClass =[KLOrderDetailBtnCell class];//@"KLOrderDetailBtnCell";
//    cellItem1.cellEdgeInsets = UIEdgeInsetsMake(20, 16, 0, 16);
//    cellItem1.model = [model stringByAppendingString:@"sectionTag1 - Cell1"];
//
//    [cellItemArray addObject:cellItem1];
//
//    KLTableViewContainerCellItem *cellItem2 = [KLTableViewContainerCellItem new];
//    cellItem2.cellTag = @"cell2";
//    cellItem2.cellViewClass = @"KLOrderDetailHeaderCell";
//    cellItem2.model = [model stringByAppendingString:@"sectionTag1 - Cell2"];
//
//    [cellItemArray addObject:cellItem2];
//
//    KLTableViewContainerCellItem *cellItem3 = [KLTableViewContainerCellItem new];
//    cellItem3.cellTag = @"cell3";
//    cellItem3.cellViewClass = @"KLOrderDetailHeaderCell";
//    cellItem3.model = [model stringByAppendingString:@"sectionTag1 - Cell3"];
//
//    [cellItemArray addObject:cellItem3];
//
//    KLTableViewContainerCellItem *cellItem4 = [KLTableViewContainerCellItem new];
//    cellItem4.cellTag = @"cell1";
//    cellItem4.cellViewClass = @"KLOrderDetailBtnCell";
//    cellItem4.model = [model stringByAppendingString:@"sectionTag1 - Cell4"];
//    [cellItemArray addObject:cellItem4];
    
    return [[KLTableViewContainerSectionItem alloc] initWithItemArray:cellItemArray
                                                           sectionTag:sectionTag];
    
}

+ (KLTableViewContainerSectionItem *)setUpTest2SectionItemWithModel:(NSString *)model sectionTag:(NSString *)sectionTag {
    
    NSMutableArray *cellItemArray = [NSMutableArray array];
//    sectionItem.sectionTag = @"sectionTag2";
//
//    NSMutableArray *cellItemArray = [NSMutableArray array];
//    KLTableViewContainerCellItem *cellItem1 = [KLTableViewContainerCellItem new];
//    cellItem1.cellTag = @"cell1";
//    cellItem1.cellViewClassStr = @"KLOrderDetailBtnCell";
//    cellItem1.cellEdgeInsets = UIEdgeInsetsMake(20, 0, 0, 0);
//    cellItem1.model = @"sectionTag2 - Cell1";
//    [cellItemArray addObject:cellItem1];
//
//    KLTableViewContainerCellItem *cellItem2 = [KLTableViewContainerCellItem new];
//    cellItem2.cellTag = @"cell2";
//    cellItem2.cellViewClassStr = @"KLOrderDetailHeaderCell";
//    cellItem2.model = @"sectionTag2 - Cell2";
//    [cellItemArray addObject:cellItem2];
//
//    KLTableViewContainerCellItem *cellItem3 = [KLTableViewContainerCellItem new];
//    cellItem3.cellTag = @"cell3";
//    cellItem3.cellViewClassStr = @"KLOrderDetailHeaderCell";
//    cellItem3.model = @"sectionTag2 - Cell3";
//    [cellItemArray addObject:cellItem3];
//
//    sectionItem.itemArray = cellItemArray;
    return [[KLTableViewContainerSectionItem alloc] initWithItemArray:cellItemArray
                                                           sectionTag:sectionTag];
}

+ (KLTableViewContainerSectionItem *)setUpTest3SectionItemWithModel:(NSString *)model sectionTag:(NSString *)sectionTag {
    
   NSMutableArray *cellItemArray = [NSMutableArray array];
    
//    NSMutableArray *cellItemArray = [NSMutableArray array];
//    KLTableViewContainerCellItem *cellItem1 = [KLTableViewContainerCellItem new];
//    cellItem1.cellTag = @"cell1";
//    cellItem1.cellViewClassStr = @"KLOrderDetailBtnCell";
//    cellItem1.model = @"sectionTag1 - Cell1";
//    cellItem1.cellEdgeInsets = UIEdgeInsetsMake(20, 16, 0, 16);
//
//    [cellItemArray addObject:cellItem1];
//
//    KLTableViewContainerCellItem *cellItem2 = [KLTableViewContainerCellItem new];
//    cellItem2.cellTag = @"cell2";
//    cellItem2.cellViewClassStr = @"KLOrderDetailHeaderCell";
//    cellItem2.model = @"sectionTag1 - Cell2";
//
//    [cellItemArray addObject:cellItem2];
//
//    KLTableViewContainerCellItem *cellItem3 = [KLTableViewContainerCellItem new];
//    cellItem3.cellTag = @"cell3";
//    cellItem3.cellViewClassStr = @"KLOrderDetailHeaderCell";
//    cellItem3.model = @"sectionTag1 - Cell3";
//    [cellItemArray addObject:cellItem3];
//
//    KLTableViewContainerCellItem *cellItem4 = [KLTableViewContainerCellItem new];
//    cellItem4.cellTag = @"cell1";
//    cellItem4.cellViewClassStr = @"KLOrderDetailBtnCell";
//    cellItem4.model = @"sectionTag1 - Cell4";
//    [cellItemArray addObject:cellItem4];
//
//    sectionItem.itemArray = cellItemArray;
    
    return [[KLTableViewContainerSectionItem alloc] initWithItemArray:cellItemArray
                                                           sectionTag:sectionTag];
}


+ (void)updateSectionItemWithModel:(NSString *)model
                        sectionTag:(NSString *)sectionTag
                  containerManager:(KLTableViewContainerManager *)containerManager {
    
    NSMutableArray *cellItemArray = [NSMutableArray array];
    
//    KLTableViewContainerCellItem *cellItem0 = [KLTableViewContainerCellItem new];
//    cellItem0.cellTag = @"cell0";
//    cellItem0.cellViewClassStr = @"KLOrderDetailBtnCell";
//    cellItem0.model = @"新加的插入到第0行哈哈哈哈哈哈";
//    [cellItemArray addObject:cellItem0];
//
//    KLTableViewContainerCellItem *cellItem1 = [KLTableViewContainerCellItem new];
//    cellItem1.cellTag = @"cell1";
//    cellItem1.cellViewClassStr = @"KLOrderDetailBtnCell";
//    cellItem1.model = @"qefqefkqerfljerfojwerofwerf22222qefqefkqerfljerfojwerofwerf22222qefqefkqerfljerfojwerofwerf22222qefqefkqerfljerfojwerofwerf22222qefqefkqerfljerfojwerofwerf22222qefqefkqerfljerfojwerofwerf22222qefqefkqerfljerfojwerofwerf22222qefqefkqerfljerfojwerofwerf22222qefqefkqerfljerfojwerofwerf22222qefqefkqerfljerfojwerofwerf22222";
//
//    [cellItemArray addObject:cellItem1];
//
//    KLTableViewContainerCellItem *cellItem2 = [KLTableViewContainerCellItem new];
//    cellItem2.cellTag = @"cell2";
//    cellItem2.cellViewClassStr = @"KLOrderDetailHeaderCell";
//    cellItem2.model = model;
//
//    [cellItemArray addObject:cellItem2];
//
//    KLTableViewContainerCellItem *cellItem3 = [KLTableViewContainerCellItem new];
//    cellItem3.cellTag = @"cell3";
//    cellItem3.cellViewClassStr = @"KLOrderDetailHeaderCell";
//    cellItem3.model = model;
//
//    [cellItemArray addObject:cellItem3];
//
//    KLTableViewContainerCellItem *cellItem4 = [KLTableViewContainerCellItem new];
//    cellItem4.cellTag = @"cell1";
//    cellItem4.cellViewClassStr = @"KLOrderDetailBtnCell";
//    cellItem4.model = model;
//    [cellItemArray addObject:cellItem4];
//
    
    [containerManager reloadSectionWithCellItems:cellItemArray sectionTag:@"sectionTag2"];
}


+ (void)updateCellsItemWithDataDict:(NSDictionary<NSString *, id> *)dataDict
                         sectionTag:(NSString *)sectionTag
                   containerManager:(KLTableViewContainerManager *)containerManager {
    
}


@end

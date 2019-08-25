//
//  KLTableViewContainerCellItem.m
//  klook
//
//  Created by yancy.chen on 2019/8/1.
//  Copyright © 2019 klook. All rights reserved.
//

#import "KLTableViewContainerCellItem.h"
#import "KLBaseContainerTableViewCellProtocol.h"


@interface KLTableViewContainerCellItem ()


@end

@implementation KLTableViewContainerCellItem

- (instancetype)initWithDataModel:(id)dataModel
                        cellClass:(Class)cellClass
                          cellTag:(NSString *)cellTag {
    self = [super init];
    if (self) {
        NSAssert(cellClass && cellTag.length, @"Invalid parameters");
        NSAssert([cellClass isSubclassOfClass:UITableViewCell.class], @"Invaild cell type");
        _cellClass = cellClass;
        _cellTag = cellTag;
        _model = dataModel;
    }
    return self;
}

- (void)registerCellForTableView:(UITableView *)tableView {
    id<KLBaseContainerTableViewCellProtocol> tableViewCell = [self.cellClass new];
    
    if ([tableViewCell respondsToSelector:@selector(kl_registerCellForTableView:)]) {
        [tableViewCell kl_registerCellForTableView:tableView];
    }
}

- (UITableViewCell *)dequeueTableViewCellWithIndexPath:(NSIndexPath *)indexPath
                                             tableView:(UITableView *)tableView {

    UITableViewCell<KLBaseContainerTableViewCellProtocol> *tableViewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.cellClass)
                                                                                                           forIndexPath:indexPath];

    if ([tableViewCell respondsToSelector:@selector(setCellEdgeInsets:)]) {
        [tableViewCell setCellEdgeInsets:self.cellEdgeInsets];
    }
    
    if ([tableViewCell respondsToSelector:@selector(setContainerCellModel:)]) {
        [tableViewCell setContainerCellModel:self.model];
    }
    
    return tableViewCell;
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
                         tableView:(UITableView *)tableView {
    CGFloat rowHeight = UITableViewAutomaticDimension;
    
    id<KLBaseContainerTableViewCellProtocol> tableViewCell = [self.cellClass new];
    if ([tableViewCell respondsToSelector:@selector(kl_customRowHeightWithModel:)]) {
        rowHeight = [tableViewCell kl_customRowHeightWithModel:self.model];
    }
    
    return rowHeight;
}


@end

//
//  KLBaseContainerTableViewCellProtocol.h
//  klook
//
//  Created by yancy.chen on 2019/7/29.
//  Copyright © 2019 klook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLBaseContainerCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol KLBaseContainerTableViewCellProtocol <NSObject, KLBaseContainerCellProtocol>

@required

// 注册 Cell 到 UITableView 中
- (void)kl_registerCellForTableView:(UITableView *)tableView;

@optional
// 设置 Insets
- (void)setCellEdgeInsets:(UIEdgeInsets)insets;

- (CGFloat)kl_customRowHeightWithModel:(id)containerCellModel;


@end

NS_ASSUME_NONNULL_END

//
//  KLPaddingTableViewCell.h
//  klook
//
//  Created by yancy.chen on 2019/8/5.
//  Copyright © 2019 klook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLBaseContainerTableViewCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface KLPaddingTableViewCell : UITableViewCell<KLBaseContainerTableViewCellProtocol>

@property (nonatomic, strong) UIView *paddingContentView;
@property (nonatomic, assign, readonly) UIEdgeInsets paddingViewEdge;

@end

NS_ASSUME_NONNULL_END

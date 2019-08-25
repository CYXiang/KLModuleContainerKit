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

// 更新数据
- (void)setContainerCellModel:(id)containerCellModel;

@end

NS_ASSUME_NONNULL_END

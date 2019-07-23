//
//  KLBaseContainerSectionIdentifier.h
//  klook
//
//  Created by yancy.chen on 2019/6/17.
//  Copyright © 2019 klook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - cell class string

static NSString *const kBaseContainerPayResultInviteViewCell = @"KLPayResultInviteViewCell";

static NSString *const kBaseContainerShopCartActivityCell = @"KLShopCartActivityCell";

#pragma mark - section tag string

static NSString *const kBaseContainerInviteViewSection = @"KLBaseContainerInviteViewSection";
static NSString *const kBaseContainerActivitySection = @"KLBaseContainerActivitySection";


@protocol KLBaseContainerSectionIdentifier <NSObject>

@end

NS_ASSUME_NONNULL_END

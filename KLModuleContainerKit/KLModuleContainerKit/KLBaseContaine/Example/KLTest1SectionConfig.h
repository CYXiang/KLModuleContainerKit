//
//  KLTestSectionViewModel.h
//  klook
//
//  Created by yancy.chen on 2019/8/2.
//  Copyright © 2019 klook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLTableViewContainerManager.h"

NS_ASSUME_NONNULL_BEGIN



@interface KLTest1SectionConfig : NSObject

+ (KLTableViewContainerSectionItem *)setUpTestSectionNewItemWithModel:(NSString *)model sectionTag:(NSString *)sectionTag;

+ (KLTableViewContainerSectionItem *)setUpTestSectionItemWithModel:(NSString *)model sectionTag:(NSString *)sectionTag;

+ (KLTableViewContainerSectionItem *)setUpTest2SectionItemWithModel:(NSString *)model sectionTag:(NSString *)sectionTag;

+ (KLTableViewContainerSectionItem *)setUpTest3SectionItemWithModel:(NSString *)model sectionTag:(NSString *)sectionTag;


+ (void)updateSectionItemWithModel:(NSString *)model
                        sectionTag:(NSString *)sectionTag
                  containerManager:(KLTableViewContainerManager *)containerManager;

+ (void)updateCellsItemWithDataDict:(NSDictionary<NSString *, id> *)dataDict
                         sectionTag:(NSString *)sectionTag
                   containerManager:(KLTableViewContainerManager *)containerManager;


@end

NS_ASSUME_NONNULL_END

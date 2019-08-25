//
//  KLTestTableContainerController.m
//  klook
//
//  Created by yancy.chen on 2019/8/1.
//  Copyright © 2019 klook. All rights reserved.
//

#import "KLTableContainerTestVC.h"
#import "KLTableViewContainerManager.h"
#import "KLTest1SectionConfig.h"


@interface KLTableContainerTestVC ()<KLTableViewContainerDataSource, KLTableViewContainerDelegate>

@property (nonatomic, strong) KLTableViewContainerManager *containerManager;

@end

@implementation KLTableContainerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.containerManager.tableView];
    
//    [self.containerManager.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.view);
//        make.top.equalTo(self.customNavBar.mas_bottom);
//    }];
    
    // 初始化全部数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //
        [self.containerManager tableViewContainerReloadData];
    });
    
    // 模拟刷新Section
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        {
            [KLTest1SectionConfig updateSectionItemWithModel:@"😃哈哈哈哈" sectionTag:@"sectionTag2" containerManager:self.containerManager];
            
            
            
//            [self.containerManager reloadCellDataWithModel:@"qefqefkqerfljerfojwerofwerf22222" sectionTag:@"sectionTag1" cellTag:@"cell1"];
//
//            [self.containerManager reloadCellDataWithModel:@"qefqefk哈哈哈哈erf222fk哈哈哈哈erk哈哈哈哈erf222fk哈哈哈哈erk哈哈哈哈erf222fk哈哈哈哈erk哈哈哈哈erf222fk哈哈哈哈erk哈哈哈哈erf222fk哈哈哈哈erk哈哈哈哈erf222fk哈哈哈哈erk哈哈哈哈erf222fk哈哈哈哈erf222fk哈哈哈哈erf222fk哈哈哈哈erf222fk哈哈哈哈erf22222" sectionTag:@"sectionTag2" cellTag:@"cell1"];
        }
        
    });
    
    // 模拟刷新 Cells
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [KLTest1SectionConfig updateSectionItemWithModel:@"😃哈哈哈哈" sectionTag:@"sectionTag2" containerManager:self.containerManager];
        
    });
    
    // 模拟刷新 Cells
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
//        [self.containerManager reloadCellDataWithModel:@"erfljerfojweroerfljerfojweroerfljerfojweroerfljerfojweroerfljerfojweroerfljerfojweroerfljerfojwero" sectionTag:@"sectionTag1" cellTag:@"cell1"];
//        [self.containerManager reloadCellDataWithModel:@"2fk哈哈哈哈erf22222" sectionTag:@"sectionTag1" cellTag:@"cell2"];
        
//        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//        [dict setValue:@"erfljerfojweroerfljerfojweroerfljerfojweroerfljerfojweroerfljerfojweroerfljerfojweroerfljerfojwero" forKey:@"cell1"];
//        [dict setValue:@"2fk哈哈哈哈erf22222" forKey:@"cell2"];
        
//        [KLTest1SectionConfig updateCellsItemWithDataDict:dict sectionTag:<#(nonnull NSString *)#> containerManager:<#(nonnull KLTableViewContainerManager *)#>]
    });

}

- (KLTableViewContainerManager *)containerManager {
    if (!_containerManager) {
        _containerManager = [[KLTableViewContainerManager alloc] init];
        _containerManager.dataSource = self;
        _containerManager.delegate = self;
    }
    return _containerManager;
}


#pragma mark - KLTableViewContainerDataSource

- (NSMutableArray<KLTableViewContainerSectionItem *> *)configTableContainerWithSectionItems {
    
    NSMutableArray *items = [NSMutableArray array];
    
    KLTableViewContainerSectionItem *item1 = [KLTest1SectionConfig setUpTestSectionItemWithModel:@"哈哈哈" sectionTag:@"sectionTag1"];
    KLTableViewContainerSectionItem *item2 = [KLTest1SectionConfig setUpTest2SectionItemWithModel:@"哈哈哈222" sectionTag:@"sectionTag2"];
    KLTableViewContainerSectionItem *item3 = [KLTest1SectionConfig setUpTest3SectionItemWithModel:@"哈哈哈333" sectionTag:@"sectionTag3"];
    KLTableViewContainerSectionItem *item4 = [KLTest1SectionConfig setUpTest3SectionItemWithModel:@"哈哈哈333" sectionTag:@"sectionTag3"];
    KLTableViewContainerSectionItem *item5 = [KLTest1SectionConfig setUpTestSectionNewItemWithModel:@"哈哈哈333ddd" sectionTag:@"sectionTag3"];
    [items addObjectsFromArray:@[item1,item2,item3,item4,item5]];
    
    
//    NSArray *dataArray = @[@"1",@"2",@"3",@"2",@"2"];
//
//    for (NSString *str in dataArray) {
//        KLTableViewContainerSectionItem *item = nil;
//        if ([str isEqualToString:@"1"]) {
//            item = [KLTest1SectionConfig setUpTestSectionItemWithModel:@"哈哈哈" sectionTag:@"sectionTag1"];
//        } else if ([str isEqualToString:@"2"]) {
//            item = [KLTest1SectionConfig setUpTest2SectionItemWithModel:@"哈哈哈2222" sectionTag:@"sectionTag2"];
//        } else if ([str isEqualToString:@"3"]) {
//            item = [KLTest1SectionConfig setUpTest3SectionItemWithModel:@"哈哈哈3333" sectionTag:@"sectionTag3"];
//        }
//        [items addObject:item];
//    }

    
    return items;
    
}




- (void)KLOrderDetailHeaderCell_btnClick:(NSString *)model {
    NSLog(@"%@",model);
}


@end

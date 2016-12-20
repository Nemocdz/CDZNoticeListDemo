//
//  NoticeListController.m
//  CDZNoticeListDemo
//
//  Created by Nemocdz on 2016/12/20.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "CDZNoticeListController.h"
#import "CDZNoticeListDataSource.h"
#import "CDZNoticeListModel.h"
#import "YYModel.h"
#import "CDZNoticeListItem.h"
#import "CDZNoticeListCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface CDZNoticeListController ()<UITableViewDelegate,UINavigationControllerDelegate>

@property (nonatomic ,strong) UITableView *noticeListView;
@property (nonatomic ,strong) CDZNoticeListDataSource *noticeListDataSource;
@property (nonatomic ,strong) NSArray *listArray;


@end

@implementation CDZNoticeListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.noticeListView];
}


- (NSDictionary *)getJsonWithJsonName:(NSString *)jsonName {
    NSString *path = [[NSBundle mainBundle]pathForResource:jsonName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

- (NSArray *)getItemsWithJson {
    NSDictionary *json =[self getJsonWithJsonName:@"notices"];
    CDZNoticeListModel *noticeListModel = [CDZNoticeListModel yy_modelWithDictionary:json];
    NSArray *listArray = [noticeListModel valueForKey:@"list"];
    NSMutableArray *result = [NSMutableArray new];
    for (NSDictionary *list in listArray){
        CDZNoticeListItem *item = [CDZNoticeListItem yy_modelWithDictionary:list];
        [result addObject:item];
    }
    return result;
}


#pragma mark - tableviewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([CDZNoticeListCell class]) cacheByIndexPath:indexPath configuration:^(id cell) {
        [self.noticeListDataSource setupModelOfCell:cell AtIndexPath:indexPath];
    }];
}

#pragma mark - setter & getter

- (UITableView *)noticeListView{
    if (!_noticeListView) {
        _noticeListView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _noticeListView.delegate = self;
        _noticeListView.dataSource = self.noticeListDataSource;
        [_noticeListView registerClass:[CDZNoticeListCell class] forCellReuseIdentifier:NSStringFromClass([CDZNoticeListCell class])];
    }
    return _noticeListView;
}

- (CDZNoticeListDataSource *)noticeListDataSource{
    if (!_noticeListDataSource) {
        _noticeListDataSource = [CDZNoticeListDataSource new];
        _noticeListDataSource.itemArray = [self getItemsWithJson];
    }
    return _noticeListDataSource;
}

@end

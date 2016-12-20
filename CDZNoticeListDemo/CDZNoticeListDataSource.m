//
//  CDZNoticeListDataSource.m
//  CDZNoticeListDemo
//
//  Created by Nemocdz on 2016/12/20.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "CDZNoticeListDataSource.h"
#import "CDZNoticeListCell.h"
@implementation CDZNoticeListDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CDZNoticeListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CDZNoticeListCell class])];
    if (!cell) {
        cell = [[CDZNoticeListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([CDZNoticeListCell class])];
    }
    [self setupModelOfCell:cell AtIndexPath:indexPath];
    return cell;
}

- (void)setupModelOfCell:(CDZNoticeListCell *)cell AtIndexPath:(NSIndexPath *)indexPath{
    cell.item = self.itemArray[indexPath.row];
}

@end

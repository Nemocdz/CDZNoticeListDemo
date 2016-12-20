//
//  CDZNoticeListDataSource.h
//  CDZNoticeListDemo
//
//  Created by Nemocdz on 2016/12/20.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UITableView.h>
@class CDZNoticeListCell;

@interface CDZNoticeListDataSource : NSObject<UITableViewDataSource>
@property (nonatomic,strong) NSArray *itemArray;

- (void)setupModelOfCell:(CDZNoticeListCell *)cell AtIndexPath:(NSIndexPath *)indexPath;

@end

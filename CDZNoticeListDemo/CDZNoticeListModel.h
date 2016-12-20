//
//  CDZNoticeListModel.h
//  CDZNoticeListDemo
//
//  Created by Nemocdz on 2016/12/20.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CDZNoticeListItem;

@interface CDZNoticeListModel : NSObject

@property (nonatomic,strong) NSArray<CDZNoticeListItem *> *list;

@end

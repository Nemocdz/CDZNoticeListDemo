//
//  CDZNoticeListModel.m
//  CDZNoticeListDemo
//
//  Created by Nemocdz on 2016/12/20.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "CDZNoticeListModel.h"
#import "CDZNoticeListItem.h"

@implementation CDZNoticeListModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [CDZNoticeListItem class]};
}

@end

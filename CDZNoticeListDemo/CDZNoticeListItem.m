//
//  CDZNoticeListItem.m
//  CDZNoticeListDemo
//
//  Created by Nemocdz on 2016/12/20.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "CDZNoticeListItem.h"

@implementation CDZNoticeListItem

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *timestamp = dic[@"timestamp"];
    if (![timestamp isKindOfClass:[NSNumber class]]) return NO;
    _createdAt = [NSDate dateWithTimeIntervalSince1970:timestamp.floatValue];
    return YES;
}

@end

@implementation Reply
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSString *avatar = dic[@"timestamp"];
    if (![avatar isKindOfClass:[NSString class]]) return NO;
    _avatar = [NSURL URLWithString:avatar];
    return YES;
}


@end

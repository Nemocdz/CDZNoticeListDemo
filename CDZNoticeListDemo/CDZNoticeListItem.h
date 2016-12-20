//
//  CDZNoticeListItem.h
//  CDZNoticeListDemo
//
//  Created by Nemocdz on 2016/12/20.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Reply;

@interface CDZNoticeListItem : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,strong) Reply *reply;
@property (nonatomic,strong) NSDate *createdAt;

@end

@interface Reply : NSObject

@property (nonatomic,strong) NSURL *avatar;
@property (nonatomic,copy) NSString *nickname;
@property (nonatomic,copy) NSString *content;

@end


//
//  CDZNoticeListCell.m
//  CDZNoticeListDemo
//
//  Created by Nemocdz on 2016/12/20.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "CDZNoticeListCell.h"
#import "CDZNoticeListItem.h"
#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "Masonry.h"

static const float avatarHeight = 40;

@interface CDZNoticeListCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIView *replyView;
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *nicknameLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *timeLabel;
    
@end

@implementation CDZNoticeListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatView];
        [self setLayout];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)creatView{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.subtitleLabel];
    [self.contentView addSubview:self.replyView];
    [self.contentView addSubview:self.timeLabel];
    [self.replyView addSubview:self.avatarView];
    [self.replyView addSubview:self.nicknameLabel];
    [self.replyView addSubview:self.contentLabel];
}

- (void)setLayout{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(30);
        make.left.mas_equalTo(self.contentView).offset(15);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
    }];
    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.and.right.equalTo(self.titleLabel);
    }];
    [self.replyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.subtitleLabel.mas_bottom).offset(5);
        make.left.and.right.equalTo(self.titleLabel);
    }];

    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(self.replyView).offset(10);
        make.height.and.width.mas_equalTo(avatarHeight);
    }];
    [self.nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarView.mas_top);
        make.left.mas_equalTo(self.avatarView.mas_right).offset(10);
        make.right.mas_equalTo(self.replyView.mas_right).offset(-15);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.nicknameLabel);
        make.top.mas_equalTo(self.nicknameLabel.mas_bottom).offset(5);
        make.bottom.mas_equalTo(self.replyView.mas_bottom).offset(-5);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.replyView.mas_bottom).offset(5);
        make.left.equalTo(self.titleLabel);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}

- (NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *string = [dateFormatter stringFromDate:date];
    return string;
}

#pragma mark - setter&getter

- (void)setItem:(CDZNoticeListItem *)item{
    self.titleLabel.text = item.title;
    self.subtitleLabel.text = item.subtitle;
    [self.avatarView sd_setImageWithURL:item.reply.avatar placeholderImage:[UIImage imageNamed:@"default"]];
    self.nicknameLabel.text = item.reply.nickname;
    self.contentLabel.text = item.reply.content;
    self.timeLabel.text = [self stringFromDate:item.createdAt];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
        _titleLabel.backgroundColor = [UIColor yellowColor];
    }
    return _titleLabel;
}

- (UILabel *)subtitleLabel{
    if (!_subtitleLabel) {
        _subtitleLabel = [UILabel new];
        _subtitleLabel.font = [UIFont systemFontOfSize:14.f];
        _subtitleLabel.backgroundColor = [UIColor yellowColor];
    }
    return _subtitleLabel;
}

- (UILabel *)nicknameLabel{
    if (!_nicknameLabel) {
        _nicknameLabel = [UILabel new];
        _nicknameLabel.font = [UIFont systemFontOfSize:16.f];
        _nicknameLabel.backgroundColor = [UIColor yellowColor];
    }
    return _nicknameLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.font = [UIFont systemFontOfSize:16.f];
        _contentLabel.backgroundColor = [UIColor yellowColor];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel){
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:14.f];
        _timeLabel.backgroundColor = [UIColor yellowColor];
    }
    return _timeLabel;
}

- (UIView *)replyView{
    if (!_replyView) {
        _replyView = [UIView new];
        _replyView.backgroundColor = [UIColor grayColor];
        _replyView.layer.cornerRadius = 5;
    }
    return _replyView;
}

- (UIImageView *)avatarView{
    if (!_avatarView) {
        _avatarView = [UIImageView new];
        _avatarView.contentMode = UIViewContentModeScaleAspectFit;
        _avatarView.layer.cornerRadius = avatarHeight / 2;
        _avatarView.clipsToBounds = YES;
    }
    return _avatarView;
}


@end

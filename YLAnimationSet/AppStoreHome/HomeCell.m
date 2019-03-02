//
//  HomeCell.m
//  YLAnimationSet
//
//  Created by zyl on 2019/3/2.
//  Copyright © 2019 zyl. All rights reserved.
//

#import "HomeCell.h"
#import "YLConst.h"

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.bgImageView];
        [self.bgView addSubview:self.titleLabel];
        [self.bgView addSubview:self.contentLabel];
    }
    return self;
}

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 40, (kScreenWidth - 40)*1.3)];
        _bgImageView.layer.cornerRadius = 15;
        _bgImageView.layer.masksToBounds = YES;
    }
    return _bgImageView;
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, kScreenWidth - 40, (kScreenWidth - 40)*1.3+25)];
        _bgView.backgroundColor = [UIColor clearColor];
    }
    return _bgView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, kScreenWidth - 30, 30)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:25];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, (kScreenWidth - 40)*1.3 - 30, kScreenWidth - 44, 15)];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.alpha = 0.5;
        _contentLabel.textColor = [UIColor whiteColor];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _contentLabel;
}

@end

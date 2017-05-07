//
//  BookCell.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "BookCell.h"

@implementation BookCell



- (void)setModel:(BookModel *)model {
    _model = model;
    [self addIconImageView];
    [self addTitleLabel];
    [self addAuthorLabel];
    [self addPressLabel];
    [self addPagesLabel];
}

- (void)addIconImageView {
    _iconImgView = [[UIImageView alloc]init];
    [self.contentView addSubview:_iconImgView];
    [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.equalTo(_iconImgView.mas_height);
    }];
    NSLog(@"%@",self.model.url);
    //TODO 这个地方随后还用做图片三级缓存处理。
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.image]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _iconImgView.image = [UIImage imageWithData:data];

        });
    });
}

- (void)addTitleLabel {
    _titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.numberOfLines = 1;
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.text = self.model.title;
    [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(5);
        make.top.equalTo(self.iconImgView.mas_top);
        make.height.equalTo(self.iconImgView.mas_height).dividedBy(4);
    }];
}

- (void)addAuthorLabel {
    _authorLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_authorLabel];
    _authorLabel.numberOfLines = 1;
    _authorLabel.textColor = [UIColor grayColor];
    _authorLabel.text = @"";
    _authorLabel.text = self.model.authorStr;
    [_authorLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.height.equalTo(self.titleLabel.mas_height);
    }];
}

- (void)addPressLabel {
    _pressLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_pressLabel];
    _pressLabel.numberOfLines = 1;
    _pressLabel.textColor = [UIColor grayColor];
    _pressLabel.text = self.model.publisher;
    [_pressLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.authorLabel.mas_left);
        make.top.equalTo(self.authorLabel.mas_bottom);
        make.height.equalTo(self.authorLabel.mas_height);
    }];
}


- (void)addPagesLabel {
    _pagesLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_pagesLabel];
    _pagesLabel.numberOfLines = 1;
    _pagesLabel.textColor = [UIColor grayColor];
    _pagesLabel.text = self.model.pages;
    [_pagesLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pressLabel.mas_left);
        make.top.equalTo(self.pressLabel.mas_bottom);
        make.height.equalTo(self.pressLabel.mas_height);
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
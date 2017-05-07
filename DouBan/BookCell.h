//
//  BookCell.h
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookModel.h"
@interface BookCell : UITableViewCell
@property(nonatomic,strong)BookModel *model;
@property(nonatomic,strong) UIImageView *iconImgView;
@property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic,strong) UILabel *authorLabel;
@property(nonatomic,strong) UILabel *pressLabel;
@property(nonatomic,strong) UILabel *pagesLabel;

@end

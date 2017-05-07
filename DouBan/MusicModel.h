//
//  MusicModel.h
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "BaseModel.h"

@interface MusicModel : BaseModel
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSArray *author;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSDictionary * attrs;
@property(nonatomic,strong)NSDictionary * rating;
@property(nonatomic,strong)NSString *average;
@property(nonatomic,strong)NSString *pubdate;
@property(nonatomic,strong)NSString *authorStr;
@end

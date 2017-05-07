//
//  BookModel.h
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface BookModel : BaseModel
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSArray * author;
@property(nonatomic,strong)NSString * author_intro;
@property(nonatomic,strong)NSString * image;
@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSString *publisher;
@property(nonatomic,strong)NSString *pages;
@property(nonatomic,strong)NSString *authorStr;
@end

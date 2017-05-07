//
//  MovieCellFactory.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MovieCellFactory.h"

@implementation MovieCellFactory
- (BaseCell *)createCell {
    return [[BookCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"movie"];
}
@end

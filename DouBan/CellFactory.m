//
//  CellFactory.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "CellFactory.h"

@implementation CellFactory
- (BaseCell *)createCell {
    return [[BaseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"base"];
}
@end

//
//  BaseVC.h
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController
@property(nonatomic,strong)BaseTableView * tableView;
- (void)didSelectedAtIndexpath:(NSIndexPath *)indexPath withBookModel:(BaseModel *)model;
@end
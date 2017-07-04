//
//  BaseTableView.h
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookViewModel.h"
#import "ReactiveObjC.h"

typedef NS_ENUM(NSInteger,CurrentCellType) {
    BaseCellType = 0,
    BookCellType,
    MusicCellType,
    MovieCellType
};

@protocol UITableViewDidSelectDelegate <NSObject>

@required

- (void)didSelectedAtIndexpath:(NSIndexPath *)indexPath withBookModel:(BookModel *)model;

@end

@interface BaseTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *listArray;
@property(nonatomic,assign)CurrentCellType cellType;
@property(nonatomic,weak)id<UITableViewDidSelectDelegate>iDelegate;
@property(nonatomic,assign)CGFloat currentCellHeight;
//替换代理
@property(nonatomic,strong)RACSubject *subject;

@end

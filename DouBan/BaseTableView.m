//
//  BaseTableView.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "BaseTableView.h"
#import "BookCellFactory.h"
@implementation BaseTableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.dataSource = self;
    self.delegate = self;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return BASE_CELL_HEIGHT;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"";
    CellFactory *cellF = nil;
    switch (_cellType) {
        case BaseCellType:
            identifier = @"base";
            cellF = [[CellFactory alloc]init];
            break;
        case BookCellType:
            identifier = @"book";
            cellF = [[BookCellFactory alloc]init];

            break;
        case MusicCellType:
            identifier = @"music";
            cellF = [[CellFactory alloc]init];
            break;
        case MovieCellType:
            identifier = @"movie";
            cellF = [[CellFactory alloc]init];

            break;
        default:
            break;
    }
    BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [cellF createCell];
    }
    cell.model = self.listArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.iDelegate && [self.iDelegate respondsToSelector:@selector(didSelectedAtIndexpath:withBookModel:)]) {
        [self.iDelegate didSelectedAtIndexpath:indexPath withBookModel:self.listArray[indexPath.row]];
    }
}

@end

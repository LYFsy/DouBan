//
//  MovieVC.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MovieVC.h"
#import "MovieViewModel.h"
@interface MovieVC ()
@property(nonatomic,strong)MovieViewModel *viewModel;

@end

@implementation MovieVC

- (MovieViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [MovieViewModel new];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.cellType = BookCellType;
    self.tableView.currentCellHeight = BOOK_CELL_HEIGHT;
    @weakify(self);
    [[self.viewModel.loadMovieDataCommand execute:nil] subscribeNext:^(id responseObjec){
        @strongify(self);
        self.tableView.listArray = responseObjec;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        }];
    //替换代理
//    RACSubject *subject = [RACSubject subject];
//    [subject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
//    self.tableView.subject = subject;
}


- (void)didSelectedAtIndexpath:(NSIndexPath *)indexPath withBookModel:(BaseModel *)model {
    BookModel *bModel = (BookModel*)model;
    NSLog(@"%@",bModel.title);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

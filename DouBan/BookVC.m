//
//  BookVC.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "BookVC.h"
#import "BaseTableView.h"
#import "BookViewModel.h"
@interface BookVC ()
@property(nonatomic,strong)BookViewModel *viewModel;
@end

@implementation BookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[BookViewModel alloc]init];
    self.tableView.cellType = BookCellType;
    [_viewModel requestBookListDataWithCompletionBlock:^(NSArray *array, NSError *error) {
        if (array) {
            self.tableView.listArray = array;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}


- (void)didSelectedAtIndexpath:(NSIndexPath *)indexPath withBookModel:(BaseModel *)model {
    BookModel *bModel = (BookModel*)model;
    NSLog(@"%@",bModel.title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

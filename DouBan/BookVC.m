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
@interface BookVC ()<UITableViewDidSelectDelegate>
@property(nonatomic,strong)BaseTableView * tableView;
@property(nonatomic,strong)BookViewModel *viewModel;
@end

@implementation BookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.tableView.iDelegate = self;
    [self.view addSubview:self.tableView];
    _viewModel = [[BookViewModel alloc]init];
    [_viewModel requestBookListDataWithCompletionBlock:^(NSArray *array, NSError *error) {
        if (array) {
            self.tableView.listArray = array;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}

- (void)didSelectedAtIndexpath:(NSIndexPath *)indexPath withBookModel:(BookModel *)model {
    NSLog(@"点击了----%@",model.title);
}

- (void)dealloc {
    NSLog(@"释放了");
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

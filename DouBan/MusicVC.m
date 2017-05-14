//
//  MusicVC.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MusicVC.h"
#import "MusicViewModel.h"
@interface MusicVC ()
@property(nonatomic,strong)MusicViewModel *viewModel;
@end

@implementation MusicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[MusicViewModel alloc]init];
    self.tableView.cellType = MusicCellType;
    self.tableView.currentCellHeight = MUSIC_CELL_HEIGHT;
    [_viewModel requestMusicListDataWithCompletionBlock:^(NSArray *array, NSError *error) {
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
}  // Dispose of any resources that can be recreated.


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

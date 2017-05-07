//
//  BaseVC.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()<UITableViewDidSelectDelegate>

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.tableView.cellType = BaseCellType;
    [self.view addSubview:self.tableView];
    self.tableView.iDelegate = self;

}
- (void)didSelectedAtIndexpath:(NSIndexPath *)indexPath withBookModel:(BaseModel *)model {
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

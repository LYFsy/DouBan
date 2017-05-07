//
//  MusicViewModel.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MusicViewModel.h"
#import "MusicModel.h"
@implementation MusicViewModel
- (NSMutableArray *)bookList {
    if (_musicList == nil) {
        _musicList = [NSMutableArray array];
    }
    return _musicList;
}

- (void)requestBookListDataWithCompletionBlock:(void(^)(NSArray *array,NSError * error)) completion {
    [[NetworkManager getInstance]getWithUrl:music_search success:^(NSData *data, NSError *error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dict valueForKey:@"musics"];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            MusicModel *model = [MusicModel yy_modelWithDictionary:obj];
            model.authorStr = @"";
            [model.author enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                model.authorStr = [model.authorStr stringByAppendingString:obj];
            }];
            [self.musicList addObject:model];
        }];
        completion(self.bookList,nil);
    } failure:^(NSData *data, NSError *error) {
        NSLog(@"%@",error);
        completion(nil,error);
    }];
}
@end

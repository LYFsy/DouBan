//
//  MovieViewModel.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MovieViewModel.h"

@implementation MovieViewModel
- (NSMutableArray *)bookList {
    if (_movieList == nil) {
        _movieList = [NSMutableArray array];
    }
    return _movieList;
}

- (void)requestBookListDataWithCompletionBlock:(void(^)(NSArray *array,NSError * error)) completion {
    [[NetworkManager getInstance]getWithUrl:movie_search success:^(NSData *data, NSError *error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dict valueForKey:@"books"];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BookModel *model = [BookModel yy_modelWithDictionary:obj];
            model.authorStr = @"";
            [model.author enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                model.authorStr = [model.authorStr stringByAppendingString:obj];
            }];
            [self.movieList addObject:model];
        }];
        completion(self.bookList,nil);
    } failure:^(NSData *data, NSError *error) {
        NSLog(@"%@",error);
        completion(nil,error);
    }];
}
@end

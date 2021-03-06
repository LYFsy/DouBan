//
//  BookViewModel.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "BookViewModel.h"

@implementation BookViewModel

- (NSMutableArray *)bookList {
    if (_bookList == nil) {
        _bookList = [NSMutableArray array];
    }
    return _bookList;
}

- (void)requestBookListDataWithCompletionBlock:(void(^)(NSArray *array,NSError * error)) completion {
    [[NetworkManager getInstance]getWithUrl:book_search success:^(NSData *data, NSError *error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dict valueForKey:@"books"];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BookModel *model = [BookModel yy_modelWithDictionary:obj];
            model.authorStr = @"";
            [model.author enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                model.authorStr = [model.authorStr stringByAppendingString:obj];
            }];
            [self.bookList addObject:model];
        }];
        completion(self.bookList,nil);
    } failure:^(NSData *data, NSError *error) {
        NSLog(@"%@",error);
        completion(nil,error);
    }];
}

@end

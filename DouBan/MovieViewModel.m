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

- (RACCommand *)loadMovieDataCommand {
    if (_loadMovieDataCommand == nil) {
        _loadMovieDataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
           return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
               [[NetworkManager getInstance]getWithUrl:book_search success:^(NSData *data, NSError *error) {
                   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                   NSArray *array = [dict valueForKey:@"books"];
                   self.movieList = [[array.rac_sequence map:^id _Nullable(id  _Nullable value) {
                       BookModel *model = [BookModel yy_modelWithDictionary:value];
                       model.authorStr = @"";
                       [model.author enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                           model.authorStr = [model.authorStr stringByAppendingString:obj];
                       }];
                       return model;
                   }] array].mutableCopy;
                   [subscriber sendNext:_movieList];
                   [subscriber sendCompleted];
               } failure:^(NSData *data, NSError *error) {
                   [subscriber sendError:error];
               }];
               
               return nil;
           }];
        }];
        
        [[_loadMovieDataCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
            BOOL flag = [x boolValue];
            if (flag) {
                NSLog(@"正在执行");
            }else {
                NSLog(@"执行完毕");
            }
        }];
    }
    
    return _loadMovieDataCommand;
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

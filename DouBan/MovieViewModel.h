//
//  MovieViewModel.h
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieViewModel : NSObject
{
    RACCommand *_loadMovieDataCommand;
}

@property (nonatomic, strong, readonly) RACCommand *loadMovieDataCommand;
@property(nonatomic,strong)NSMutableArray *movieList;
- (void)requestBookListDataWithCompletionBlock:(void(^)(NSArray *array,NSError * error)) completion;
@end

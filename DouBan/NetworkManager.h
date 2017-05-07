//
//  NetworkManager.h
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DataCompletionBlock)(NSData * data,NSError * error);


@interface NetworkManager : NSObject

@property(nonatomic,strong)NSMutableArray *tasksQueue;
@property(nonatomic,strong)NSOperationQueue *networkQueue;
+ (NetworkManager *)getInstance;

- (void)getWithUrl:(NSString *)urlStr success:(DataCompletionBlock)success failure:(DataCompletionBlock)failure;
@end

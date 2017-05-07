//
//  MusicModel.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MusicModel.h"

@implementation MusicModel

- (void)setRating:(NSDictionary *)rating {
    if (rating) {
        self.average = [rating valueForKey:@"average"];
    }
}

- (void)setAttrs:(NSDictionary *)attrs {
    if (attrs) {
        self.pubdate = [attrs valueForKey:@"pubdate"];
    }
}

@end

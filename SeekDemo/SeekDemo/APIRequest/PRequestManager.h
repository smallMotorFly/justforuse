//
//  PRequestManager.h
//  SeekDemo
//
//  Created by Handlecar1 on 17/1/7.
//  Copyright © 2017年 Handlecar1. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "PRequestModel.h"
typedef NS_ENUM(NSInteger, UpLoadDataStyle) {
    UpLoadDataStyleVideo = 1,//视频类型
    UpLoadDataStyleImage,//图片类型
};

NS_ASSUME_NONNULL_BEGIN

typedef void(^PResponserCallBack)(PRequestModel * _Nullable responser,  NSError * _Nullable error);

@interface PRequestManager : AFHTTPSessionManager

+ (instancetype)sharePRequestManager;

//GET
- (void)sendRequestWithURLStr:(NSString *)urlStr parameters:(NSDictionary *)params completion:(PResponserCallBack)resopnserCallBack;
//upLoad
- (void)uploadDatas:(NSArray <NSData *>*)dataArray upType:(UpLoadDataStyle)upType parameters:(NSDictionary *)params urlStr:(NSString *)urlStr progress:(void (^)(NSProgress * _Nullable))uploadProgressBlock completionHandler:(void (^)(id _Nullable, NSError * _Nullable))completionHandler;

NS_ASSUME_NONNULL_END

@end

//
//  PHTTPRequestSender.h
//  SeekDemo
//
//  Created by Handlecar1 on 17/1/7.
//  Copyright © 2017年 Handlecar1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRequestManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface PHTTPRequestSender : NSObject
//GET
+ (void)sendRequestWithURLStr:(NSString *)URLStr parameters:(id _Nullable)parameters completion:(PResponserCallBack)resopnserCallBack;
//上传
+ (void)uploadDatas:(NSArray <NSData *>*)dataArray upType:(UpLoadDataStyle)upType parameters:(NSDictionary *)params urlStr:(NSString *)urlStr progress:(void (^)(NSProgress * _Nullable))uploadProgressBlock completionHandler:(void (^)(id _Nullable, NSError * _Nullable))completionHandler;


@end
NS_ASSUME_NONNULL_END

//
//  PHTTPRequestSender.m
//  SeekDemo
//
//  Created by Handlecar1 on 17/1/7.
//  Copyright © 2017年 Handlecar1. All rights reserved.
//

#import "PHTTPRequestSender.h"

@implementation PHTTPRequestSender


+ (void)sendRequestWithURLStr:(NSString *)URLStr parameters:(id _Nullable)parameters completion:(PResponserCallBack)resopnserCallBack {

    NSDictionary *requestDataInfo = [PHTTPRequestSender getStrategyWithParams:parameters];
   
    [[PRequestManager sharePRequestManager] sendRequestWithURLStr:URLStr parameters:requestDataInfo completion:resopnserCallBack];
}

+ (void)uploadDatas:(NSArray <NSData *>*)dataArray upType:(UpLoadDataStyle)upType parameters:(NSDictionary *)params urlStr:(NSString *)urlStr progress:(void (^)(NSProgress * _Nullable))uploadProgressBlock completionHandler:(void (^)(id _Nullable, NSError * _Nullable))completionHandler {
    NSDictionary *requestDataInfo = [PHTTPRequestSender getStrategyWithParams:params];

    [[PRequestManager sharePRequestManager] uploadDatas:dataArray upType:upType parameters:requestDataInfo urlStr:urlStr progress:uploadProgressBlock completionHandler:completionHandler];
}

+ (NSDictionary *)getStrategyWithParams:(NSDictionary *)params {
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionary];
    
    /****
     * 设置 特定参数格式
     ****/
    NSMutableDictionary *requestDataInfo = [NSMutableDictionary dictionary];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:requestInfo options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    if (jsonStr.length)
    {
        jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    }

    return requestDataInfo;
}


@end

//
//  PRequestManager.m
//  SeekDemo
//
//  Created by Handlecar1 on 17/1/7.
//  Copyright © 2017年 Handlecar1. All rights reserved.
//

#import "PRequestManager.h"

#define BASE_URL @"https://"



static PRequestManager *manager = nil;

@implementation PRequestManager

+ (instancetype)sharePRequestManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PRequestManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return manager;
}

- (void)sendRequestWithURLStr:(NSString *)urlStr parameters:(NSDictionary *)params completion:(PResponserCallBack)resopnserCallBack {
    
    [self GET:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        PRequestModel *responseModel = [[PRequestModel alloc] init];
        
        if (responseObject != nil)
        {
            [responseModel setValuesForKeysWithDictionary:responseObject];

        }
        
        resopnserCallBack(responseModel, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        resopnserCallBack(nil, error);
        NSLog(@"error: %@",error);
    }];

}

/**
 上传文件
 
 @param dataArray 二进制文件数组
 @param params params
 @param urlStr 地址
 
 */
- (void)uploadDatas:(NSArray <NSData *>*)dataArray upType:(UpLoadDataStyle)upType parameters:(NSDictionary *)params urlStr:(NSString *)urlStr progress:(void (^)(NSProgress * _Nullable))uploadProgressBlock completionHandler:(void (^)(id _Nullable, NSError * _Nullable))completionHandler {
    
    [self POST:urlStr parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [dataArray enumerateObjectsUsingBlock:^(NSData * _Nonnull data, NSUInteger idx, BOOL * _Nonnull stop) {
            
            // 上传文件
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *spendStr = upType == UpLoadDataStyleImage ? @".png" : @".mp4";
            NSString * fileName =[NSString stringWithFormat:@"%@%@", str,spendStr];
            NSString *mineType = upType == UpLoadDataStyleImage ? @"image/png" : @"video/quicktime";
            [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:mineType];
        }];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        uploadProgressBlock(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject, nil);
        NSLog(@"上传成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil, error);
        NSLog(@"上传失败");
    }];
}

@end

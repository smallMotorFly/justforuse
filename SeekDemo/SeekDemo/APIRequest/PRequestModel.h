//
//  PRequestModel.h
//  SeekDemo
//
//  Created by Handlecar1 on 17/1/7.
//  Copyright © 2017年 Handlecar1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRequestModel : NSObject

/**
 status = 1;//状态码  100表示成功  否则失败
 msg;//错误描述
 Object;//返回字典信息
 list;//返回数组信息
 systemerrormsg;//系统报错
 currpage //当前页数
 totalpages //全页数
 */

@property (nonatomic) NSInteger status;  //
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) NSDictionary *object;
@property (nonatomic, copy) NSArray *list;
@property (nonatomic, copy) NSString *systemerrormsg;
@property (nonatomic) NSInteger currpage;
@property (nonatomic) NSInteger totalpages;

@end

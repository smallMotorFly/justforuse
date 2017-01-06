//
//  PRequestModel.m
//  SeekDemo
//
//  Created by Handlecar1 on 17/1/7.
//  Copyright © 2017年 Handlecar1. All rights reserved.
//

#import "PRequestModel.h"

@implementation PRequestModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@ undefined key is %@",NSStringFromClass([self class]),key);
}



@end

//
//  MBProgressHUD+Hud.h
//  SeekDemo
//
//  Created by Handlecar1 on 17/1/7.
//  Copyright © 2017年 Handlecar1. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Hud)
/**
 显示纯文字 自动消失？若果NO 自己调用消失方法 [hub hideAnimated:YES afterDelay:delay];
 
 @param message 显示的文字内容
 @param view 提示框所在的父视图
 @param autoHidden 是否自动隐藏
 @ return
 */
+ (MBProgressHUD *)showMessageText:(NSString *)message toView:(UIView *)view anutoHidden:(BOOL)autoHidden;

/**
 纯文字样式 自定义消失时间
 
 @param message 显示的文字内容
 @param view 提示框所在的父视图
 @param delay 延时时间
 @ return
 */
+ (MBProgressHUD *)showMessageText:(NSString *)message toView:(UIView *)view afterDelay:(NSTimeInterval)delay;



/**
 菊花样式
 
 @param message 显示的文字内容
 @param view 提示框所在的父视图
 @ return
 */
+ (MBProgressHUD *)showProgressMessage:(NSString *)message toView:(UIView *)view;

@end

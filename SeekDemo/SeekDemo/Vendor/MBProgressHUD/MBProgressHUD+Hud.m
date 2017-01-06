//
//  MBProgressHUD+Hud.m
//  SeekDemo
//
//  Created by Handlecar1 on 17/1/7.
//  Copyright © 2017年 Handlecar1. All rights reserved.
//

#import "MBProgressHUD+Hud.h"

@implementation MBProgressHUD (Hud)
+ (MBProgressHUD *)showMessageText:(NSString *)message toView:(UIView *)view anutoHidden:(BOOL)autoHidden {
    
    if (autoHidden) {
        return [MBProgressHUD showMessageText:message toView:view afterDelay:1.0];
    }
    return [MBProgressHUD showMessageText:message toView:view];
}

+ (MBProgressHUD *)showMessageText:(NSString *)message toView:(UIView *)view afterDelay:(NSTimeInterval)delay {
    
    MBProgressHUD *hub = [MBProgressHUD showMessageText:message toView:view];
    [hub hideAnimated:YES afterDelay:delay];
    return hub;
}

+ (MBProgressHUD *)showMessageText:(NSString *)message toView:(UIView *)view {
    
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hub.mode = MBProgressHUDModeText;
    hub.label.text = message;
    
    return hub;
}

+ (MBProgressHUD *)showProgressMessage:(NSString *)message toView:(UIView *)view {
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hub.label.text = message;
    return hub;
}



@end

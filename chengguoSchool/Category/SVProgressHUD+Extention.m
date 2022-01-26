//
//  SVProgressHUD+Extention.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "SVProgressHUD+Extention.h"

@implementation SVProgressHUD (Extention)
+ (void)hudConfig {
    [SVProgressHUD setMinimumDismissTimeInterval:2.0f];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setCornerRadius:5.f];
    [SVProgressHUD setMinimumSize:CGSizeMake(100, 30)];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
}

+ (void)showHudText:(NSString *)message {
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@""]];
    [SVProgressHUD showInfoWithStatus:message];
}


+ (void)showSuccess:(NSString *)message {
    [SVProgressHUD setSuccessImage:[UIImage imageNamed:@"hud_success"]];
    [SVProgressHUD setMinimumDismissTimeInterval:2.0f];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setCornerRadius:5.f];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD showSuccessWithStatus:message];
}

+ (void)showError:(NSString *)message {
    
    [SVProgressHUD setErrorImage:[UIImage imageNamed:@"hud_error"]];
    [SVProgressHUD setMinimumDismissTimeInterval:2.0f];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setCornerRadius:5.f];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD showErrorWithStatus:message];
}

+ (void)showLoading:(NSString *)message {
    [SVProgressHUD showWithStatus:message];
}

@end

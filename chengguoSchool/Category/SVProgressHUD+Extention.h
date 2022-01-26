//
//  SVProgressHUD+Extention.h
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import <SVProgressHUD/SVProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface SVProgressHUD (Extention)

+ (void)hudConfig;

/**
 显示Text的HUD

 @param message 输出的文字
 */
+ (void)showHudText:(NSString *)message;

/**
 显示成功的HUD（带有Image）

 @param message 输出的文字
 */
+ (void)showSuccess:(NSString *)message;

/**
 显示失败的HUD（带有Image）
 
 @param message 输出的文字
 */
+ (void)showError:(NSString *)message;

/**
 显示Loading的HUD

 @param message Loading下面的文字
 */
+ (void)showLoading:(NSString *)message;

@end

NS_ASSUME_NONNULL_END

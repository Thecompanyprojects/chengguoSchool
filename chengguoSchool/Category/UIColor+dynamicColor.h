//
//  UIColor+dynamicColor.h
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (dynamicColor)

+ (instancetype)initWithLightColor:(NSInteger)lightColor darkColor:(NSInteger)darkColor;

@end

NS_ASSUME_NONNULL_END

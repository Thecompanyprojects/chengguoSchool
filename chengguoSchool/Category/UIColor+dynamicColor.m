//
//  UIColor+dynamicColor.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/22.
//

#import "UIColor+dynamicColor.h"

@implementation UIColor (dynamicColor)

+ (instancetype) initWithRGB:(NSInteger)rgb {
    
    return [UIColor colorWithRed:((rgb & 0xFF0000) >> 16) /255.0
                           green:((rgb & 0xFF00) >> 8) /255.0
                            blue:(rgb & 0xFF) /255.0
                           alpha:1.0];
}

+ (instancetype)initWithLightColor:(NSInteger)lightColor darkColor:(NSInteger)darkColor {
    
    NSString *showDarkColor = [[NSUserDefaults standardUserDefaults] objectForKey:@"showDarkColor"];
    
    if ([showDarkColor intValue]==1) {
        if (@available(iOS 13.0, *)) {
            return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
                if(traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                    return [UIColor initWithRGB:darkColor];
                } else {
                    return [UIColor initWithRGB:lightColor];
                }
            }];
        } else {
            return [UIColor initWithRGB:lightColor];
        }
    }
    else
    {
        return [UIColor initWithRGB:lightColor];
    }
}

@end

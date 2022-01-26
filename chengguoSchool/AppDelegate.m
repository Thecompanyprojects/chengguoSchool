//
//  AppDelegate.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/22.
//

#import "AppDelegate.h"
#import "HomeVC.h"
#import "LoginVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];

    LoginVC *login = [LoginVC new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:login];
    
    TabBarController *tabbar = [TabBarController new];
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    if (token.length==0) {
        self.window.rootViewController = nav;
    }
    else{
        self.window.rootViewController = tabbar;
    }
    [self.window makeKeyAndVisible];
    return YES;
}

@end

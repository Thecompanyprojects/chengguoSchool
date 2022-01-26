//
//  TabBarController.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/22.
//

#import "TabBarController.h"
#import "MessageVC.h"
#import "HomeVC.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *array;
    array = @[@"HomeVC",@"MessageVC"];
    NSArray *imgArray = @[@"首页2",@"消息"];
    NSArray *nameArray = @[@"首页",@"消息"];
    NSArray *titleArray = @[@"",@"",@"",@""];
    NSArray *sImageArray = @[@"首页",@"消息2"];
    if (@available(iOS 13.0, *)) {
        [[UITabBar appearance] setUnselectedItemTintColor:[UIColor lightGrayColor]];
    }
    for (int i = 0; i < 2; i++) {
        
        Class class = NSClassFromString(array[i]);
        UIViewController *vc = [[class alloc] init];
        BaseNavigationController *nvc = [[BaseNavigationController alloc] initWithRootViewController:vc];
        UIImage *image = [UIImage imageNamed:imgArray[i]];
        nvc.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nvc.tabBarItem.title = nameArray[i];
        nvc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
        vc.navigationItem.title = titleArray[i];
        UIImage *sImage = [UIImage imageNamed:sImageArray[i]];
        nvc.tabBarItem.selectedImage = [sImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        //更改tabbar上字体的颜色
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGBA(0xFF7A33, 1), NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:10],NSFontAttributeName, nil] forState:UIControlStateSelected];
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:10],NSFontAttributeName, nil] forState:UIControlStateNormal];
        [self addChildViewController:nvc];
    }
}
@end

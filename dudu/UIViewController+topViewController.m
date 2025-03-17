//
//  TopView.m
//  dudu
//
//  Created by dd_luliluli on 2024/9/13.
//

#import "UIViewController+topViewController.h"

@implementation UIViewController (topViewController)

+ (UIViewController *)topViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [self topViewController:rootViewController];
}

+ (UIViewController *)topViewController:(UIViewController *)viewController {
    if (viewController.presentedViewController) {
        return [self topViewController:viewController.presentedViewController];
    }else if([viewController isKindOfClass:UINavigationController.class]) {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        return [self topViewController:navigationController.visibleViewController];
    }else if([viewController isKindOfClass:UITabBarController.class]) {
        UITabBarController *tabBarController = (UITabBarController *)viewController;
        return [self topViewController:tabBarController.selectedViewController];
    }else {
        return viewController;
    }
}
@end

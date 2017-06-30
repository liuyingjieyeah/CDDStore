//
//  DCNavigationController.m
//  CDDMall
//
//  Created by apple on 2017/5/26.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import "DCNavigationController.h"

// Controllers

// Models

// Views

// Vendors
#import "UINavigationController+FDFullscreenPopGesture.h"
// Categories
#import "UIBarButtonItem+DCBarButtonItem.h"
// Others

@interface DCNavigationController ()



@end

@implementation DCNavigationController

#pragma mark - load初始化一次
+ (void)load
{
    [self setUpBase];
}

#pragma mark - LifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_fullscreenPopGestureRecognizer.enabled = YES;
    
}

#pragma mark - <初始化>
+ (void)setUpBase
{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = RGBA(231, 23, 37, 1.0);
    [bar setShadowImage:[UIImage new]];
    [bar setTintColor:[UIColor whiteColor]];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置导航栏字体颜色
    UIColor * naiColor = [UIColor whiteColor];
    attributes[NSForegroundColorAttributeName] = naiColor;
    attributes[NSFontAttributeName] = PFR20Font;
    bar.titleTextAttributes = attributes;
}

#pragma mark - <返回>
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count >= 1) {
        //返回按钮自定义
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];

        //影藏BottomBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //跳转
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 点击
- (void)backClick {
    
    [self popViewControllerAnimated:YES];
}

//#pragma mark - 导航栏上状态栏为白色
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}


@end

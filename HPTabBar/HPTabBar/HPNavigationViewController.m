//
//  HPNavigationViewController.m
//  HPTabBar
//
//  Created by David_Tian on 15/8/10.
//  Copyright (c) 2015年 com.ifenghui. All rights reserved.
//

#import "HPNavigationViewController.h"

@interface HPNavigationViewController ()

@end

@implementation HPNavigationViewController

/**
 *  第一次使用这个类的时候会调用(1个类只会调用1次)
 */
+ (void)initialize
{
    // 1.设置导航栏主题
    [self setupNavBarTheme];
    
    // 2.设置导航栏按钮主题
    [self setupBarButtonItemTheme];
}

/**
 *  设置导航栏按钮主题
 */
+ (void)setupBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance]; 
    
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    textAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] =  [UIColor lightGrayColor];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme
{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 设置背景
//    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
//    [navBar setBackgroundColor:[UIColor redColor]];
    [navBar setBarTintColor:[UIColor colorWithWhite:1 alpha:0.7]];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    // 设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:19];
    [navBar setTitleTextAttributes:textAttrs];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{[super pushViewController:viewController animated:animated];
    if (self.viewControllers.count > 0) {
//        viewController.hidesBottomBarWhenPushed = YES;
//        UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
//        [left setBackgroundImage:[UIImage imageNamed:@"tabbar_more"] forState:UIControlStateNormal];
//        [left setBackgroundImage:[UIImage imageNamed:@"tabbar_more_highlighted"] forState:UIControlStateHighlighted];
//        left.frame = (CGRect){CGPointZero, left.currentBackgroundImage.size};
//        //        [button addTarget:self action:@selector(<#selector#>) forControlEvents:UIControlEventTouchUpInside];
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:left];
//        
//        UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
//        [right setBackgroundImage:[UIImage imageNamed:@"tabbar_more"] forState:UIControlStateNormal];
//        [right setBackgroundImage:[UIImage imageNamed:@"tabbar_more_highlighted"] forState:UIControlStateHighlighted];
//        right.frame = (CGRect){CGPointZero, right.currentBackgroundImage.size};
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:right];
        
        // 2.导航栏上面的item
        UIBarButtonItem *barItem =[UIBarButtonItem appearance];
        UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
        [left setBackgroundImage:[UIImage imageNamed:@"tabbar_more"] forState:UIControlStateNormal];
        [left setBackgroundImage:[UIImage imageNamed:@"tabbar_more_highlighted"] forState:UIControlStateHighlighted];
        [left setFrame:CGRectMake(0, 0, 80, 40)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:left];
        // 2.2.设置item的文字属性
        NSDictionary *barItemTextAttr = @{ NSForegroundColorAttributeName : [UIColor darkGrayColor],
                                           NSFontAttributeName : [UIFont systemFontOfSize:15] };
        [barItem setTitleTextAttributes:barItemTextAttr forState:UIControlStateNormal];
        [barItem setTitleTextAttributes:barItemTextAttr forState:UIControlStateHighlighted];
    }
    
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end

//
//  HPTabBarViewController.m
//  HPTabBar
//
//  Created by David_Tian on 15/8/5.
//  Copyright (c) 2015年 com.ifenghui. All rights reserved.
//

#import "HPTabBarViewController.h"
#import "HPTabBar.h"

@interface HPTabBarViewController ()<HPTabBarDelegate>
@property (strong, nonatomic) HPTabBar *customTabBar;
@end

@implementation HPTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTabBar];
    [self setupAllChildViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
    }
}

- (void)setupTabBar{
    HPTabBar *customTabBar = [[HPTabBar alloc]init];
    customTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabBar];
    customTabBar.delegate = self;
    self.customTabBar = customTabBar;
}

- (void)setupAllChildViewController {
    UIViewController *home = [[UIViewController alloc]init];
    [self setupChildViewController:home title:@"首页" imageName:@"menu_home" selectedImageName:@"menu_home"];
    UIViewController *message = [[UIViewController alloc]init];
    [self setupChildViewController:message title:@"动态" imageName:@"menu_find" selectedImageName:@"menu_find"];
    UIViewController *find = [[UIViewController alloc]init];
    [self setupChildViewController:find title:@"好友" imageName:@"menu_friend" selectedImageName:@"menu_friend"];
    UIViewController *theme = [[UIViewController alloc]init];
    [self setupChildViewController:theme title:@"主题" imageName:@"menu_theme" selectedImageName:@"menu_theme"];
    UIViewController *setting = [[UIViewController alloc]init];
    [self setupChildViewController:setting title:@"设置" imageName:@"menu_setting" selectedImageName:@"menu_setting"];
    
}

- (void)setupChildViewController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
    [self.customTabBar addTabBarButtonWithItem:vc.tabBarItem];
}

#pragma mark- HPTabBarDelegate
- (void)tabBar:(HPTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to {
    self.selectedIndex = to;
}

@end

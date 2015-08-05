//
//  HPTabBar.h
//  HPTabBar
//
//  Created by David_Tian on 15/8/5.
//  Copyright (c) 2015年 com.ifenghui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HPTabBar;

@protocol HPTabBarDelegate <NSObject>

@optional
- (void)tabBar:(HPTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;

@end

@interface HPTabBar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;
@property (weak, nonatomic) id<HPTabBarDelegate> delegate;

@end

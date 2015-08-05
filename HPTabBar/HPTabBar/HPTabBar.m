//
//  HPTabBar.m
//  HPTabBar
//
//  Created by David_Tian on 15/8/5.
//  Copyright (c) 2015年 com.ifenghui. All rights reserved.
//

#import "HPTabBar.h"
#import "HPTabBarButton.h"

@interface HPTabBar()

@property (strong, nonatomic) NSMutableArray *tabBarButtons;
@property (strong, nonatomic) HPTabBarButton *selectedButton;

@end

@implementation HPTabBar

- (NSMutableArray *)tabBarButtons {
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item {
    HPTabBarButton *btn = [[HPTabBarButton alloc]init];
    [self addSubview:btn];
    [self.tabBarButtons addObject:btn];
    btn.item = item;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    if (self.tabBarButtons.count == 1) {
        [self btnClick:btn];
    }
}

- (void)btnClick:(HPTabBarButton *)btn {
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:btn.tag];
    }
    
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    
    CGFloat btnH = h;
    CGFloat btnW = w / self.subviews.count;
    CGFloat btnY = 0;
    
    for (int i = 0; i<self.subviews.count; i++) {
        CGFloat btnX = btnW * i;
        
        HPTabBarButton *btn = self.tabBarButtons[i];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn setTag:i];
    }
}

@end

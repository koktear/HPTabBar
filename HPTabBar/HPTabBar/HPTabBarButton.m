//
//  HPTabBarButton.m
//  HPTabBar
//
//  Created by David_Tian on 15/8/5.
//  Copyright (c) 2015年 com.ifenghui. All rights reserved.
//

#import "HPTabBarButton.h"

#define HPTabBarButtonRatio 0.6

@implementation HPTabBarButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter|UIViewContentModeScaleToFill;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted{}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imgW = contentRect.size.width-20;
    CGFloat imgH = contentRect.size.height * HPTabBarButtonRatio-10;
    return CGRectMake(10, 5, imgW, imgH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height * HPTabBarButtonRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setItem:(UITabBarItem *)item {
    _item = item;
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)dealloc {
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
}

@end

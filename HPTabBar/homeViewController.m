//
//  homeViewController.m
//  HPTabBar
//
//  Created by David_Tian on 15/8/10.
//  Copyright (c) 2015年 com.ifenghui. All rights reserved.
//

#import "homeViewController.h"
#import "HPTableViewController.h"

@interface homeViewController ()

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.navigationController pushViewController:[[HPTableViewController alloc]init] animated:YES];
}
 




@end

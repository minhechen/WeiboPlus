//
//  WPTabBarViewController.m
//  WeiboPlus
//
//  Created by AC-Mac on 12/09/2017.
//  Copyright © 2017 MackChan  minhechen@gmail.com. All rights reserved.
//

#import "WPTabBarViewController.h"
#import "WPTabBar.h"
#import "WPDefine.h"

@interface WPTabBarViewController () <UITabBarControllerDelegate, UITabBarDelegate>

@property( nonatomic, strong) WPTabBar *wpTabBar;

@end

@implementation WPTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupBarItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupBarItems {
    // 调整tabbar
    _wpTabBar = [[WPTabBar alloc] init];
    _wpTabBar.tabBarType = WPTabBarTypeWeibo;
//    _wpTabBar.quickDelegate = self;
    _wpTabBar.delegate = self;
    // 更换系统自带的tabbar
    [self setValue:_wpTabBar forKeyPath:@"tabBar"];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    [tabBar setNeedsLayout];
}

@end

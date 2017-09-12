//
//  WPTabBar.h
//  WeiboPlus
//
//  Created by AC-Mac on 12/09/2017.
//  Copyright © 2017 MackChan  minhechen@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WPTabBarType) {
    WPTabBarTypeNormal = 0, // normal tabBar
    WPTabBarTypeWeibo = 1, // weibo TabBar
};

@interface WPTabBar : UITabBar

@property(nonatomic, assign) WPTabBarType tabBarType;

@end

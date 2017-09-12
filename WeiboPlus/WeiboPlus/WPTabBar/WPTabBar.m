//
//  WPTabBar.m
//  WeiboPlus
//
//  Created by AC-Mac on 12/09/2017.
//  Copyright © 2017 MackChan  minhechen@gmail.com. All rights reserved.
//

#import "WPTabBar.h"
#import "WPDefine.h"
#import "UIView+frame.h"
#import "UIView+Extension.h"

#define barItemWidth 44

@interface WPTabBar ()

@property(nonatomic, strong) UIButton *composeButton;

@end

@implementation WPTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置所有tabbarButton的frame
    _tabBarType = WPTabBarTypeWeibo;
    [self setupAllTabBarButtonsFrame];
}

- (void)setupAllTabBarButtonsFrame
{
    int index = 0;
    
    if (_composeButton == nil) {
        _composeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, barItemWidth, barItemWidth)];
        
        [_composeButton setBackgroundImage:SY_IMAGE(@"tabbar_compose_button") forState:UIControlStateNormal];
        [_composeButton setBackgroundImage:SY_IMAGE(@"UIControlStateHighlighted") forState:UIControlStateHighlighted];
        [_composeButton setImage:SY_IMAGE(@"tabbar_compose_icon_add") forState:UIControlStateNormal];
        [self addSubview:_composeButton];
    }
    [self addSubview:_composeButton];
    // 遍历所有的button
    for (UIView *tabBarButton in self.subviews) {
        // 如果不是UITabBarButton， 直接跳过
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        // 根据索引调整位置
        [self setupTabBarButtonFrame:tabBarButton atIndex:index];
        // 遍历UITabBarButton中的所有子控件
        [self setupTabBarButtonTextColor:tabBarButton atIndex:index];

        index++;
    }
    
    
    
}

/**
 *  设置某个按钮的frame
 *
 *  @param tabBarButton 需要设置的按钮
 *  @param index        按钮所在的索引
 */
- (void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
{
    CGFloat buttonW = 0;
    CGFloat buttonH = 0;
    if (_tabBarType == WPTabBarTypeNormal) {
        buttonW = self.width / self.items.count;
        buttonH = self.height;
        tabBarButton.width = buttonW;
        tabBarButton.height = buttonH;
        tabBarButton.x = buttonW * index;
        tabBarButton.y = 0;
    }else if (_tabBarType == WPTabBarTypeWeibo){
       buttonW = self.width / (self.items.count + 1);
        buttonH = self.height;
        tabBarButton.width = buttonW;
        tabBarButton.height = buttonH;
        if (index >= self.items.count/2) {
            tabBarButton.x = buttonW * (index + 1);
            if (index == self.items.count/2) {
                _composeButton.frame = CGRectMake(buttonW * index, 0, buttonW, buttonH);
            }
            
        }else{
            tabBarButton.x = buttonW * index;
        }
        tabBarButton.y = 0;
    }else{
        buttonW = self.width / self.items.count;
        buttonH = self.height;
        tabBarButton.width = buttonW;
        tabBarButton.height = buttonH;
        tabBarButton.x = buttonW * index;
        tabBarButton.y = 0;
    }
    
}

/**
 *  设置某个按钮的文字颜色
 *
 *  @param tabBarButton 需要设置的按钮
 *  @param index        按钮所在的索引
 */
- (void)setupTabBarButtonTextColor:(UIView *)tabBarButton atIndex:(int)index
{
    // 选中按钮的索引
    NSInteger selectedIndex = [self.items indexOfObject:self.selectedItem];
    for (UILabel *label in tabBarButton.subviews) {
        if (![label isKindOfClass:[UILabel class]]) continue;
        label.textAlignment = NSTextAlignmentCenter;
        // 设置字体
        label.font = [UIFont boldSystemFontOfSize:12];
        if (selectedIndex == index) { // Button选中
            label.textColor = WPWeiboGrayColor;
        } else { // Button没有选中
            label.textColor = WPWeiboGrayColor;
        }
        label.height = self.height * 0.4;
        label.width = self.height;
    }
}

@end

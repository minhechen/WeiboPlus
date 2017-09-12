//
//  WPDefine.h
//  WeiboPlus
//
//  Created by AC-Mac on 12/09/2017.
//  Copyright © 2017 MackChan  minhechen@gmail.com. All rights reserved.
//

#ifndef WPDefine_h
#define WPDefine_h

/**
 *  UIImage
 */
#pragma mark -
#pragma mark -- UIImage宏
#define SY_IMAGE(name) ([UIImage imageNamed:(name)])
/**
 *  颜色宏
 */
#pragma mark -
#pragma mark -- 颜色宏

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f \
alpha:(a)]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/** 默认颜色 亮绿色 00C08D*/
#define WPBaseColor RGBCOLOR(0, 192, 141)
/** 西瓜红 */
#define WPRedColor RGBCOLOR(255, 77, 85)
/** 微博灰 */
#define WPWeiboGrayColor RGBCOLOR(51, 51, 51)
// print debug logs
#ifdef DEBUG
# define DLog(fmt, ...); NSLog((@"[%s]\n" "[%s %d] " fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif

#endif /* WPDefine_h */

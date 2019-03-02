//
//  YLConst.h
//  YLAnimationSet
//
//  Created by zyl on 2019/3/2.
//  Copyright © 2019 zyl. All rights reserved.
//

#ifndef YLConst_h
#define YLConst_h

// 获取屏幕宽度
#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width

// 获取屏幕高度
#define kScreenHeight   [[UIScreen mainScreen] bounds].size.height

// 获取状态栏高度，iPhoneX之前手机状态栏高度为20，iPhoneX为40，这个宏定义动态获取状态栏高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define COLOR_WHITE [UIColor whiteColor]
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define UIColorFromRGB(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#endif /* YLConst_h */

//
//  UIColor+BDHexColor.h
//  冰点
//
//  Created by 冰点 on 15/8/24.
//  Copyright (c) 2015年 冰点. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIColor (BDHexColor)

+ (UIColor *)hexFloatColor:(NSString *)hexStr;
+ (UIColor *)hexFloatColor:(NSString *)hexStr alpha:(CGFloat)alpha;
//设置图片透明度
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;
+ (UIImage*) imageWithColor:(UIColor*) color;

/*!
 *  @brief  背景色：#F0F0F0
 *
 *  @return 灰色
 */
+ (UIColor *)backgroundColor;

/*!
 *  @brief  边框橘黄色
 *
 *  @return 橘黄色
 */
+ (UIColor *)borderOrange;

/*!
 *  @brief  文字黑色
 *
 *  @return 黑色
 */
+ (UIColor *)textBlack;

/*!
 *  @brief  文字灰
 *
 *  @return 灰色
 */
+ (UIColor *)textGray;

/*!
 @brief 导航条颜色
 
 @return 白色
 */
+ (UIColor *)navBarColor;


+ (UIColor *)liveToolBarBackgroundColor;
+ (UIColor *)navBarTitleColor;
+ (UIColor *)borderWhiteBlackColor;
@end

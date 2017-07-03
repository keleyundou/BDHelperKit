//
//  UIColor+BDHexColor.m
//  冰点
//
//  Created by 冰点 on 15/8/24.
//  Copyright (c) 2015年 冰点. All rights reserved.
//

#import "UIColor+BDHexColor.h"

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGB(r,g,b) RGBA(r,g,b,1.0)


@implementation UIColor (BDHexColor)

+ (UIColor *)hexFloatColor:(NSString *)hexStr {
    
    return [self hexFloatColor:hexStr alpha:1.0];
}

+ (UIColor *)hexFloatColor:(NSString *)hexStr alpha:(CGFloat)alpha
{
    if (hexStr.length < 6)
        return nil;
    
    unsigned int red_, green_, blue_;
    NSRange exceptionRange;
    exceptionRange.length = 2;
    
    //red
    exceptionRange.location = 0;
    [[NSScanner scannerWithString:[hexStr substringWithRange:exceptionRange]]scanHexInt:&red_];
    
    //green
    exceptionRange.location = 2;
    [[NSScanner scannerWithString:[hexStr substringWithRange:exceptionRange]]scanHexInt:&green_];
    
    //blue
    exceptionRange.location = 4;
    [[NSScanner scannerWithString:[hexStr substringWithRange:exceptionRange]]scanHexInt:&blue_];
    
    UIColor *resultColor = RGBA(red_, green_, blue_, alpha);
    return resultColor;
}

//设置图片透明度
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, image.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage*) imageWithColor:(UIColor*) color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

#pragma mark -
#pragma mark - 自定义颜色

/*!
 *  @brief  背景色：#F0F0F0
 *
 *  @return 灰色
 */
+ (UIColor *)backgroundColor
{
    return RGBA(240,240,240,1);
}

/*!
 *  @brief  边框橘黄色
 *
 *  @return 橘黄色
 */
+ (UIColor *)borderOrange{
    return RGB(255, 144, 0);
}

/*!
 *  @brief  文字黑色
 *
 *  @return 黑色
 */
+ (UIColor *)textBlack{
   return RGBA(51,51,51,1);
}

/*!
 *  @brief  文字灰
 *
 *  @return 灰色
 */
+ (UIColor *)textGray{
    return RGBA(102,102,102,1);
}

/*!
 @brief 导航条颜色

 @return 白色
 */
+ (UIColor *)navBarColor
{
    return RGBA(255, 255, 255, 0.9);
}

+ (UIColor *)tabBarItemNormalColor {
    return RGBA(102,102,102,1);
}

+ (UIColor *)tabBarItemSelectedColor {
    return RGBA(34,34,34,1);
}

+ (UIColor *)liveToolBarBackgroundColor {
    return RGBA(0, 0, 0, 0.7);
}

+ (UIColor *)navBarTitleColor {
    return [self textBlack];
}

+ (UIColor *)borderWhiteBlackColor {
    return RGB(153, 153, 153);
}

@end
